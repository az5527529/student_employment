$(document)
		.ready(
				function() {

					var mark = $('#mark').val();

					var head = document.getElementById('searchPannel');

					if (mark == '2' || mark == 2) {

						head.style.display = "block";
						document.getElementById("closeButton").value = "保存";
						// 获取；列表信息
						getDeatillist();
					
						var $floor = $("#floor").find("option:selected").text();
						var newhtml;
						
						if ($floor == '其他') {
							var floor = $("#floor1").val();
							newhtml = "<br><input class='form-control' name='otherFloor' data-bv-notEmpty data-bv-notEmpty-message='请输入楼层' value='"
									+ floor + "' placeholder='输入楼层' >";
							$("#floordiv").append(newhtml);
						}
					}

					var city = $("input[name='city']").val();

					var address = $('#detailAddress').val();
					// 展示地图
					map(address, city);
					
				});

function setPostion() {

	$('#mapform').bootstrapValidator('addField', 'otherFloor', {  
        validators: {  
            notEmpty: {  
                message: '请输入楼层'  
            }  
        }  
    });  
	$('#mapform').bootstrapValidator('addField', 'otherMall', {  
        validators: {  
            notEmpty: {  
                message: '请输入装饰城'  
            }  
        }  
    });  
	
	var bootstrapValidator = $("#mapform").data('bootstrapValidator');
	bootstrapValidator.validate();
	
	if(bootstrapValidator.isValid()){
		var p = $('#pr').val();
		var c = $('#ct').val();
		var a = $('#area').val();
		
		 var s= $('#sel').find("option:selected").text();
		 var f=$("#floor").val();
		 
		 if(s=='其他'){
			 s=$("input[name='otherMall']").val();
		 }
		 if(f=='其他'){
			 f=$("input[name='otherFloor']").val();
		 }
		
		var address = p + c + a + s + f;

		/* 将mall的名称直接传到后台减少从数据库查找 */
		$("input[name='mallName']").val(s);

		map(address, c);
	}
    
}

function map(_psotion, _city) {
	try {
		var map = new BMap.Map('allmap');

		map.centerAndZoom(_city, 12);

		map.addControl(new BMap.NavigationControl());
		map.addControl(new BMap.ScaleControl());
		map.addControl(new BMap.OverviewMapControl());
		map.enableScrollWheelZoom();

		var myGeo = new BMap.Geocoder();

		myGeo.getPoint(_psotion, function(point) {
			if (point) {
				map.centerAndZoom(point, 16);
				map.clearOverlays();
				var marker = new BMap.Marker(point);
				map.addOverlay(marker);

				var mark = $('#mark').val();

				if (mark == '2' || mark == 2) {

					marker.enableDragging();

				}

				marker.addEventListener('dragend', function(e) {

				});
			}
		}, _city);
	} catch (err) {

	}
}

function onchangmall(thisObject) {
	
	$(thisObject).parent().children("small").remove();
	$("#mapform").removeClass("has-error");
	$(".form-group").removeClass("has-error");
	newhtml = "<br><input class='form-control' data-bv-notEmpty data-bv-notEmpty-message='输入装饰城' name='otherMall' placeholder='输入装饰城' >";
	if ($(thisObject).val() == '其他') {
		$("#malldiv").append(newhtml);
	} else {
		$(thisObject).parent().children("br").remove();
		$(thisObject).parent().children("input").remove();
	}
	
}
function onchangfloor(thisObject) {
	$(thisObject).parent().children("small").remove();
	$("#mapform").removeClass("has-error");
	$(".form-group").removeClass("has-error");
	newhtml = "<br><input class='form-control' data-bv-notEmpty data-bv-notEmpty-message='请输入楼层' name='otherFloor' placeholder='输入楼层' >";
	if ($(thisObject).val() == '其他') {
		$("#floordiv").append(newhtml);
	} else {
		$(thisObject).parent().children("br").remove();
		$(thisObject).parent().children("input").remove();
	}
}

function getDeatillist() {

	var _f = $("#floor1").val();

	var _m = $("#mid").val();

	var _p = $("#p1").val();

	var _c = $("#c1").val();

	var _a = $("#a1").val();

	$("#floor").find("option[value=" + _f + "]").attr("selected", true);

	$('#distpickera').distpicker({
		province : _p,
		city : _c,
		district : _a,
		autoSelect : true
	});

	$.ajax({
		type : "POST",
		url : "listmall.htm",
		dataType : 'json',
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				var index = data[i].mallId;
				var value = data[i].name;

				var html = "<option " + "value=" + index + ">" + value
						+ "</option>";
				if (index == _m) {
					html = "<option " + "value=" + index + " selected='true'>"
							+ value + "</option>";
				}

				$('#sel').append(html);
			}
			var $mall = $("#sel").val();
			
			if ($mall == '其他') {
				var mall = $("#mid").val();
				var html = "<br><input class='form-control' name='otherMall' data-bv-notEmpty data-bv-notEmpty-message='请输入装饰城' value='"
						+ mall + "' placeholder='输入装饰城' >";
				$("#malldiv").append(html);
			}
		},
		error : function(data) {

		}

	});
}