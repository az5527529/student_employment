/**
 * Created by wenyuqian on 15/12/16.
 */
+function ($){
    var NavMenu = function(element,options){
        this.$element = $(element);
        this.options = $.extend({},NavMenu.DEFAULTS,options);
        this.init();
    };

    /*导航菜单默认属性*/
    NavMenu.DEFAULTS = {
	   
    };

    /*导航菜单初始化*/
    NavMenu.prototype.init = function() {
		/*html初始化*/
		this.data(this.options.data);
		
		/*默认选中初始化*/
		this.current(this.options.current);
		
		/*事件初始化*/
		this.initEvent();
    };
	
	/*数据/样式初始化*/
    NavMenu.prototype.data = function(data) {
        var html = '<div class="navmenu">';
        for (var i = 0; i < data.length; i++) {
            //html += '<a href="javaScript:;" attr="'+data[i].href+'" mid="'+data[i].id+'"><span><i class="iconfont icon-'+data[i].icon+'"></i>'+data[i].text+'</span></a>';
        	 //html += '<a href="javaScript:;" attr="'+data[i].href+'" mid="'+data[i].id+'"><img src="style/css/images/nav/tv.png" style="width:32px;height:32px;"><div class="tit">'+data[i].text+'</div></a>';
//            html += '<a href="javaScript:;" attr="'
//            	 +data[i].href+'" mid="'+data[i].id
//            	 +'"><span class="icon-nav-tv" style="width:32px;height:32px;display:inline-block"></span><div class="tit">'
//            	 +data[i].text+'</div></a>';

            html += '<a href="javaScript:;" attr="'
           	 +data[i].href+'" mid="'+data[i].id
           	 +'"><span class="'
           	 +data[i].iconCls +'" style="width:32px;height:32px;display:inline-block"></span><div class="tit">'
           	 +data[i].text+'</div></a>';
            
           
        };
        html += '</div>';
        this.$element.html(html);
    };
	
	/*选中项初始化*/
    NavMenu.prototype.current = function(current) {
        if(current === ''){ //如果current为空
            this.$element.find('a').eq(0).addClass('select');//默认选中第一个
        }
        else{
            var currentid = this.$element.find('a[mid='+current+']'), //错误的值(获取传来的current值是否是存在的a标签中的mid值)
                selectid = $(".select").attr("mid"); //获取当前选中项a标签的mid值
            if(current === undefined || !currentid.length){
                this.$element.find('a').eq(0).addClass('select');//默认选中第一个
            }else{
                if(selectid != current){ //判断当前选中是否与已选项相同
                    this.$element.find('a').removeClass('select');
                    this.$element.find('a[mid='+current+']').addClass('select');
                }  
            }
        }
        
    };
	
	/*事件初始化*/
    NavMenu.prototype.initEvent = function() {
        var self = this;
		this.$element.on('click','a',function(){
            var mid = $(this).attr('mid'),
                href = $(this).attr('attr');
            self.current(mid);
            self.options.onclick.call(self, mid, href);
        });
    };


    function Plugin(option){
        var args = Array.prototype.slice.call(arguments, 1);
        var returnValue = this;
        this.each(function(){
            var $this = $(this),
                data = $this.data('mg.navmenu'),
                options = typeof option === 'object' && option;

            if(!data){
                $this.data('mg.navmenu',(data = new NavMenu(this,options)));
            }

            if(typeof option === 'string'){
                returnValue = data[option].apply(data, args) || returnValue;
            }
        });
        return returnValue;
    }

    var old = $.fn.navmenu;

    $.fn.navmenu = Plugin;
    $.fn.navmenu.Constructor = NavMenu;

    $.fn.navmenu.noConflict = function(){
        $.fn.navmenu = old;
        return this;
    }
}(jQuery);