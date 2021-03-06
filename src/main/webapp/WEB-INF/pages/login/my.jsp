<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
 
<c:if test="${empty user }">
 	<div class="container">
	<button type="button" class="btn btn-success btn-block btn-lg"
		style="margin-top: 50%;"
		onclick="gotoUrl1('${basePath}/login/signIn','signIn')">
		<span class="glyphicon glyphicon-user"></span> 登录
	</button>
	</div>
</c:if>
<c:if test="${not empty user }">
	<table style="width: auto; margin: 10px;">
		<tr>
			<td>
			<div class="userPhotoBig" itemscope
					itemtype="http://schema.org/ImageGallery">
					<figure itemprop="associatedMedia" itemscope
						itemtype="http://schema.org/ImageObject">
						<a
							href="${basePath }/login/getPhoto?id=${user.id}&name=${user.photoLarge}"
							itemprop="contentUrl" data-size="${fn:split(user.photoLarge,'_')[1] }x${fn:split(user.photoLarge,'_')[2] }"> <img
							src="${basePath }/login/getPhoto?id=${user.id}&name=${user.photoSmall}"
							class="img-circle" width="80" height="80"
							style="width: 80px; height: 80px; cursor: pointer;"
							onerror="nohead(this);" itemprop="thumbnail">
							<figcaption itemprop="caption description"></figcaption>
						</a>
					</figure>
				</div>
			</td>
			<td valign="bottom">&nbsp;${user.nickName }</td>
		</tr>
	</table>
	<ul class="list-group my-list" style="margin-top: 10px;">
		<li class="list-group-item"
			onclick="gotoUrl1('${basePath}/login/register2')">个人资料<span
			class="pull-right glyphicon glyphicon-menu-right"></span></li>
		<li class="list-group-item"
			onclick="gotoUrl1('${basePath}/login/register3')">车主认证 <span
			class="pull-right glyphicon glyphicon-menu-right"></span>
		</li>
		<li class="list-group-item" onclick="">身份
			<div class="pull-right">
				<select id="userType">
					<c:forEach var="o" items="${userTypeList }">
						<c:if test="${o.id eq user.type }">
							<option value="${o.id }" selected="selected">${o.name }</option>
						</c:if>
						<c:if test="${o.id ne user.type }">
							<option value="${o.id }">${o.name }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</li>
		<li class="list-group-item"
			onclick="gotoUrl1('${basePath}/login/register3')">账号安全 <span
			class="pull-right glyphicon glyphicon-menu-right"></span>
		</li>
		<li class="list-group-item" data-toggle="modal"
			data-target="#signOutModal" style="text-align: center; color: red;">退出当前账号
		</li>
	</ul>
</c:if>

<script type="text/javascript">
	$(document).ready(function() {
		
		document.addEventListener('touchmove', function(e) {
			e.preventDefault();
		}, false);
		
		$('#userType').mobiscroll().select({
	        theme: '',     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: 'scroller',       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: 'bottom', // Specify display mode like: display: 'bottom' or omit setting to use default 
	        lang: 'zh',        // Specify language like: lang: 'pl' or omit setting to use default 
	        headerText: function (valueText) { return "选择身份"; },
	        inputClass:'selectC', //为插件生成的input添加样式
	        //placeholder: '请选择从事行业',//placeholder
	        onSelect: function(valueText,inst){
	        	var v;
	        	$("#userType > option").each(function(){
            		if($(this).text() == valueText){
            			v = $(this).val();
            			return false;
            		}
            	});
	         	$.ajax({
	         		url:'${basePath}/login/updateUser',
	         		data:'type=type&value='+v,
	         		type:'post',
	         		success:function(data){
	         			if(!data.valid){
	         				alertMsg(data.message);
	         			}else{
	         				alertMsg(data.message,"success");
	         			}
	         		},
	         		error:function(){
	         			alertMsg('保存失败！');
	         		}
	         	});
	        }
		});
		
	});
 
	function showBigHeadPhoto() {
		$("#uploadCarPhotoModal").modal("show");
		$("#imgCarPhoto").attr("src",
				"${basePath}/login/getPhoto?id=${user.id}&name=${user.photoLarge}");
	}
		
	initPhotoSwipeFromDOM('.userPhotoBig');
	
</script>