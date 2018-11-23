class WeixinController < ActionController::Base
  
  def ajax_payment_req
    
    total_fee = params[:total_fee]
    
    if session[:openid]
      
      r = Random.new
      num = r.rand(1000...9999)
      out_trade_no = DateTime.now.strftime("%Y%m%d%H%M%S") + num.to_s #生产随机订单号，这里用当前时间加随机数，保证唯一
      bodytxt = "奇妙实验室订单"
      # if order.campaign.slug=="support-lanlan"
      #   bodytxt="为幼儿瘫母撑起希望"
      # end
      # if order.campaign.slug=="hbzjsj"
      #   bodytxt="红包拯救世界"
      # end
      params = {
        body: bodytxt,
        out_trade_no: out_trade_no,
        # total_fee: 1,
        total_fee: total_fee,
        spbill_create_ip: '127.0.0.1',
        notify_url: root_url + 'weixin_notify',
        trade_type: 'JSAPI', # could be "JSAPI" or "NATIVE",
        openid: session[:openid]
        # openid: 'oaR9aswmRKvGhMdb6kJCgIFKBpeg' # required when trade_type is `JSAPI` this is me
        # openid: 'oaR9as940svyxuTEuKZgeibjC7ng'
      }

      r = WxPay::Service.invoke_unifiedorder params
      
      puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      puts r
      puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      
      if r["return_code"] == 'SUCCESS' && r["result_code"] == 'SUCCESS'

        @js_noncestr = SecureRandom.uuid.tr('-', '')
        @js_timestamp = Time.now.getutc.to_i.to_s
        @js_app_id = r["appid"]
        @package = "prepay_id=" + r["prepay_id"]

        
        user = User.where(:openid => session[:openid]).first
        if !user
          user = User.new
          user.openid = session[:openid]
          user.save
        end
        
        # order = Order.new
#         order.user_id = user.id
#         order.out_trade_no = out_trade_no
#         order.status = 0
#         order.save
#
#
#         order_item = OrderItem.new
#         order_item.course_id = user.id
#         order_item.base_amount = (total_fee / 100).ceil
#         order_item.quantity = 1
#
#         order.order_items << order_item
          
        params_pre_pay_js = {
          appId: @js_app_id,
          nonceStr: @js_noncestr,
          package: @package,
          timeStamp: @js_timestamp,
          signType: 'MD5'
        }

        @js_pay_sign = WxPay::Sign.generate(params_pre_pay_js)
      
        render json: {
            code: 200,
            appId: @js_app_id, 
            timeStamp: @js_timestamp, 
            nonceStr: @js_noncestr, 
            package: @package,
            signType: "MD5",
            paySign: @js_pay_sign}.to_json and return
      
      else
        
        render json: {
          code: 500,
          appId: "", 
          timeStamp: "", 
          nonceStr: "", 
          package: "",
          signType: "MD5",
          paySign: ""}.to_json and return
            
      end

    end
    
  end
  
  def ajax_native_payment_req
    
    total_fee = params[:total_fee]
    
    r = Random.new
    num = r.rand(1000...9999)
    
    @out_trade_no = DateTime.now.strftime("%Y%m%d%H%M%S") + num.to_s
    @notify_url = root_url + 'weixin_notify'

    bodytxt = "奇妙实验室订单"

    params = {
      body: bodytxt,
      out_trade_no: @out_trade_no,
      total_fee: total_fee,
      spbill_create_ip: '127.0.0.1',
      notify_url: @notify_url,
      trade_type: 'NATIVE' # could be "JSAPI" or "NATIVE",
    }

    r = WxPay::Service.invoke_unifiedorder params
    @weixin_init_success = false
    @qr_url = "#"
  
    if r["return_code"] == 'SUCCESS' && r["result_code"] == 'SUCCESS'

      qr = RQRCode::QRCode.new( r["code_url"], :size => 5, :level => :h )
      @qr_url = qr.to_img.resize(200, 200).to_data_url
      
      render json: { code: 200, qr_url: @qr_url}.to_json and return
          
    else
      
      render json: { code: 500, qr_url: ""}.to_json and return
                
    end

  end
  
  def weixin_notify
    
    logger.info "hahahahahahahahahahahahahahahaha"
    
    result = Hash.from_xml(request.body.read)["xml"]
    
    if WxPay::Sign.verify?(result)
      
      openid = result["openid"]
      out_trade_no = result["out_trade_no"]
      transaction_id = result["transaction_id"]
      logger.info out_trade_no
      logger.info transaction_id
      logger.info "hahahahahahahahahahahahahahahaha"
      
      order = Order.where(:out_trade_no => out_trade_no).first

      if order

        order.transaction_id = transaction_id
        order.status = Order::Completed
        order.save

      end
      
      # find your order and process the post-paid logic.
      render :xml => {return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false)

    else
      
      render :xml => {return_code: "SUCCESS", return_msg: "签名失败"}.to_xml(root: 'xml', dasherize: false)
      
    end

  end
  
end