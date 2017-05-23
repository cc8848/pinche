<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div id="headerInfo" class="font-16">
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-8 text-center">
			<span>车主发布详情</span>
		</div>
		<div class="col-xs-2"></div>
	</div>
</div>
<div id="wrapperInfo" class="font-16">
	<div id="scrollerInfo">
		<div class="container">
			<c:if test="${result ne null }">
				<c:if test="${result.state eq 1 }">
					<div class="row">
						<div class="col-xs-12">
							<table style="font-size: 14px;">
								<tr>
									<td rowspan="2" valign="middle"><img
										src="${basePath }/login/getPhoto?id=${user.id}&name=${user.photoSmall}"
										style="width: 50px; height: 50px;" class="img-circle"
										onerror="nohead(this);">&nbsp;&nbsp;</td>
									<td valign="bottom">${user.nickName }</td>
								</tr>
								<tr>
									<td valign="bottom"><font color="gray"><fmt:formatDate
												value="${result.addTime }" pattern="MM-dd HH:mm" />&nbsp;&nbsp;&nbsp;&nbsp;<label
											class="glyphicon glyphicon-eye-open" title="浏览次数"></label>&nbsp;${result.lookCount }</font></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row" style="height: 16px;"></div>
					<div class="row">
						<div class="col-xs-12" style="font-size: 20px;">
							<span style="color: gray; font-size: 16px;">从</span>&nbsp;&nbsp;${result.fromZoneName }&nbsp;&nbsp;<span
								style="color: gray; font-size: 16px;">到</span>&nbsp;&nbsp;${result.toZoneName }
						</div>
					</div>
					<div class="row" style="height: 16px;"></div>
					<div class="row">
						<div class="col-xs-3 text-nowrap left-label">途经地点</div>
						<div class="col-xs-8">${result.viaName }</div>
						<%-- <div class="col-xs-8">
							<c:if test="${result.viaName ne '无' }">
								<ul style="list-style: none; margin: 0; padding: 0;">
									<c:if test="${result.via1 ne null and result.via1 ne ''}">
										<li>${result.via1 }</li>
									</c:if>
									<c:if test="${result.via2 ne null and result.via2 ne '' }">
										<li>${result.via2 }</li>
									</c:if>
									<c:if test="${result.via3 ne null and result.via3 ne '' }">
										<li>${result.via3 }</li>
									</c:if>
									<c:if test="${result.via4 ne null and result.via4 ne '' }">
										<li>${result.via4 }</li>
									</c:if>
									<c:if test="${result.via5 ne null and result.via5 ne '' }">
										<li>${result.via5 }</li>
									</c:if>
								</ul>
							</c:if>
							<c:if test="${result.viaName eq '无' }">
									${result.viaName}
								</c:if>
						</div> --%>
					</div>
					<div class="row">
						<div class="col-xs-3 text-nowrap left-label">联系人</div>
						<div class="col-xs-8">${result.contactUser }&nbsp;
							<span class="${result.sex=='男'?'badge-1':'badge-2'}">${result.sex == null ? '--':result.sex}</span>
							<span class="${result.sex=='男'?'badge-1':'badge-2'}">${result.age == null ? '--':result.age }</span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3 text-nowrap left-label">联系电话</div>
						<div class="col-xs-9">${result.contacePhone }</div>
					</div>
					<c:if test="${result.timeLimit eq 1 }">
						<div class="row">
							<div class="col-xs-3 text-nowrap left-label">发车时间</div>
							<div class="col-xs-8">
								<fmt:formatDate value="${result.pdate }" pattern="MM-dd" />
								<fmt:formatDate value="${result.ptime }" pattern="HH:mm" />
								&nbsp;&nbsp;<span class="timeago"
									style="color: gray; font-size: 14px;"
									title="<fmt:formatDate value="${result.pdate }" pattern="yyyy-MM-dd" /> <fmt:formatDate value="${result.ptime }" pattern="HH:mm" />"></span>
							</div>
						</div>
					</c:if>
					<c:if test="${result.timeLimit eq 2 }">
						<div class="row">
							<div class="col-xs-3 text-nowrap left-label">发车时间</div>
							<div class="col-xs-8">${result.pweekName }&nbsp;<fmt:formatDate
									value="${result.ptime }" pattern="HH:mm" />
							</div>
						</div>
					</c:if>
					<div class="row">
						<div class="col-xs-3 text-nowrap left-label">车辆型号</div>
						<div class="col-xs-8">${result.carTypeName }，${result.carStyle }，${result.carColorName }</div>
					</div>
					<div class="row">
						<div class="col-xs-3 text-nowrap left-label">拼车价格</div>
						<div class="col-xs-8">
							<b>${result.cost }</b>&nbsp;元/人
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3 text-nowrap left-label">剩余空位</div>
						<div class="col-xs-8">
							<b>${result.pnum }</b>&nbsp;位
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 text-nowrap left-label">车主留言</div>
					</div>
					<div class="row">
						<div class="col-xs-12" style="word-break: break-all;">${result.remark }</div>
					</div>

					<div class="row">
						<div class="col-xs-12 text-nowrap left-label">车辆照片</div>
					</div>
					<div class="row" style="padding: 2px;">
						<img
							src="${basePath}/login/getCarPhoto?id=${user.id}&name=${user.carPhotoLarge1}"
							class="img-responsive center-block carPhone" onerror="noFind();">
					</div>
					<div class="row" style="padding: 2px;">
						<img
							src="${basePath}/login/getCarPhoto?id=${user.id}&name=${user.carPhotoLarge2}"
							class="img-responsive center-block carPhone" onerror="noFind();">
					</div>
					<div class="row">
						<div class="col-xs-12">
							<a href="javascript:void(0)">联系我时，请说是在邯郸拼车网上看到的，谢谢！</a>
						</div>
					</div>
				</c:if>
				<c:if test="${result.state eq 0 }">
					<div class="row">
						<div class="col-xs-12 text-center" style="color: gray;">
							<h2>此记录已删除</h2>
						</div>
					</div>
				</c:if>
			</c:if>
			<c:if test="${result eq null }">
				<div class="row">
					<div class="col-xs-12 text-center" style="color: gray;">
						<h2>此记录不存在</h2>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>
<div id="footerInfo">
	<div class="container">
		<div class="row text-center">
			<c:if test="${result.state eq 1 }">
				<%
					if (!"index".equals(request.getParameter("type"))) {
				%>
				<c:if test="${curUser ne null and curUser.id eq result.addUser }">
					<div class="col-xs-6">
						<table style="width: 100%; text-align: center;">
							<tr>
								<td><a href="javascript:history.back();"> <span
										class="glyphicon glyphicon-home"></span><br>返回
								</a></td>
							</tr>
						</table>
					</div>
					<div class="col-xs-6">
						<table style="width: 100%; text-align: center;">
							<tr>
								<td><a
									href="javascript:removeInfo('carOwner','${result.id }')"> <span
										class="glyphicon glyphicon-remove"></span><br>删除
								</a></td>
							</tr>
						</table>
					</div>
				</c:if>
				<%
					} else {
				%>
				<div class="col-xs-4 col-sm-4 col-md-4">
					<table style="width: 100%; text-align: center;">
						<tr>
							<td><a href="javascript:history.back();"> <span
									class="glyphicon glyphicon-remove"></span><br>再看看
							</a></td>
						</tr>
					</table>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4">
					<table style="width: 100%; text-align: center;">
						<tr>
							<td><a href="tel:${result.contacePhone }"> <span
									class="glyphicon glyphicon-earphone"></span><br>打电话
							</a></td>
						</tr>
					</table>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4">
					<table style="width: 100%; text-align: center;">
						<tr>
							<td><a href="sms:${result.contacePhone }"> <span
									class="glyphicon glyphicon-envelope"></span><br>发短信
							</a></td>
						</tr>
					</table>
				</div>
				<%
					}
				%>
			</c:if>
			<c:if test="${result eq null or result.state eq 0 }">
				<div class="col-xs-12 text-center">
					<table style="width: 100%; text-align: center;">
						<tr>
							<td><a href="javascript:history.back();"> <span
									class="glyphicon glyphicon-home"></span><br>返回
							</a></td>
						</tr>
					</table>
				</div>
			</c:if>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(".timeago").timeago();
	var myScrollInfo = new IScroll('#wrapperInfo', {
		probeType : 1, //probeType：1对性能没有影响。在滚动事件被触发时，滚动轴是不是忙着做它的东西。probeType：2总执行滚动，除了势头，反弹过程中的事件。这类似于原生的onscroll事件。probeType：3发出的滚动事件与到的像素精度。注意，滚动被迫requestAnimationFrame（即：useTransition：假）。  
		scrollbars : true,
		mouseWheel : true,
		interactiveScrollbars : true,
		shrinkScrollbars : 'scale',
		fadeScrollbars : true
	//preventDefault : false
	});

	//当所有图片加载完毕后刷新iscroll
	isImgLoad("carPhone", function() {
		myScrollInfo.refresh();

	});
</script>