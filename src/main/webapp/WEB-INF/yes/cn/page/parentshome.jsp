<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 父母之家-->




<div class="parents pageParents">
	<div class="head-plh"></div>
	<div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s">
	  <a href="${bannerImages.cndetailurl}">
		<div class="banner"
			style="background-image:url(${basePath}api/base/attachment/downloadbyAttId?attId=${bannerImages.cnimageurl})">
		
		</div>
		</a>
	</div>
	<div class="main">
		<div class="title wow fadeInUp" data-wow-duration="1s"
			data-wow-delay="0.2s">
			<h3>父母之家</h3>
			<p>全方面多方位的教育环境熏陶</p>
		</div>
		<div class="link">
			<div class="clearfix">
				<ul class="clearfix">

					<c:forEach items="${parentsclasslist}" var="parentsclass">
						<li><a class="a trans_3  
						
						
						<c:if test="${parentsclassuid==parentsclass.uid}">
						cur
						</c:if>
						wow fadeInUp"
							data-wow-duration="1s" data-wow-delay="0.2s" href="parentshome.html?parentsclassuid=${parentsclass.uid}"><span>${parentsclass.classremark}</span>
								<em>${parentsclass.eclassremark}</em></a></li>
					</c:forEach>


				</ul>
			</div>
		</div>
		<div class="content">
			<ul>

				<c:forEach items="${parentslist}" var="parents">


					<li class="wow fadeInUp" data-wow-duration="1s"
						data-wow-delay="0.7s"><a href="parentshomedetails.html?uid=${parents.uid}">
							<div class="box">
								<div class="img hoverImg">
									<img
										src="${basePath}api/base/attachment/downloadbyAttId?attId=${parents.image}"
										alt="">
								</div>
								<div class="text">
									<div class="tit">${parents.title}</div>
									<p>${parents.remark}</p>
								</div>
								<div class="date flex-center-left">
									<div>
										<span>${parents.yueri}</span> <em>${parents.nian}</em>
									</div>
								</div>
							</div>
					</a></li>

				</c:forEach>



			</ul>
			<div class="page">
				
				<c:if test="${page>1}">
					<a class="pre trans_3"
						href="parentshome.html?parentsclassuid=${parentsclassuid}&page=${page-1}">上一页</a>
				</c:if>
				<a class="trans_3 cur" href="#">${page}</a>
				<c:if test="${pagecount>page}">
					<a class="next trans_3"
						href="parentshome.html?parentsclassuid=${parentsclassuid}&page=${page+1}">下一页</a>
				</c:if>

			</div>
		</div>
	</div>
</div>
<footer style="margin-top: 50px;">
        <div class="contact wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s">
            <span>
                <a href="order.html" class="btn btn1">
                    <i class="icon icon-c1"></i>试听预约
                </a>
                <img src="images/lion2.png" alt="">
                <a href="contactus.html" class="btn">
                    <i class="icon icon-c2"></i>联系我们
                </a>
            </span>
        </div>

  <div class="foot wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s">
            <div class="main">
                <div class="top">
                    <div class="item flex">
                        <span class="ico">
                            <i class="icon icon-f1"></i>
                        </span>
                        <div class="flex-1">
                            <span>领先教育</span>
                            <p>背景实力雄厚的早教机构</p>
                        </div>
                    </div>
                    <div class="item flex">
                        <span class="ico">
                            <i class="icon icon-f2"></i>
                        </span>
                        <div class="flex-1">
                            <span>智能测评</span>
                            <p>最适合中国宝宝的多元智能测评</p>
                        </div>
                    </div>
                    <div class="item flex">
                        <span class="ico">
                            <i class="icon icon-f3"></i>
                        </span>
                        <div class="flex-1">
                            <span>课程体系</span>
                            <p>全方面多方位的教育环境熏陶</p>
                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <dl>
                        <dt>
                            <span>导航Navigation</span>
                        </dt>
                        <dd><a href="aboutmutong.html">关于沐橦</a></dd>
                        <dd><a href="coursesystem.html">课程体系</a></dd>
                        <dd><a href="order.html">预约试听</a></dd>
                        <dd><a href="activities.html">精彩活动</a></dd>
                        <dd><a href="parentshome.html">父母之家</a></dd>
                        <dd><a href="news.html">新闻动态</a></dd>
                        <dd><a href="contactus.html">联系我们</a></dd>
                    </dl>
                    <dl>
                        <dt>
                            <span>课程体系</span>
                        </dt>
                        <dd><a href="coursesystemdatails.html?step=A">早教课程</a></dd>
                        <dd><a href="coursesystemdatails.html?step=B">托育课程</a></dd>
                        <dd><a href="coursesystemdatails.html?step=C">奇幻之旅</a></dd>
                        <dd><a href="coursesystemdatails.html?step=D">成长*BABY</a></dd>
                        <dd><a href="coursesystemdatails.html?step=E">音乐*BABY</a></dd>
                        <dd><a href="coursesystemdatails.html?step=F">创意*BABY</a></dd>
                    </dl>
                    <dl>
                        <dt><span>联系我们</span></dt>
                        <dd>
                            <div class="ct">
                                <p class="clearfix"><i class="icon icon-f4"></i>福建· 漳州· 长泰县金座丽景10号楼（写字楼）三楼310-317号</p>
                                <p class="clearfix"><i class="icon icon-f4"></i><span class="col-yellow">0596-8216986</span>（周一到周五 8:00-18:00）</p>
                                <p class="clearfix"><i class="icon icon-f4"></i><a href="">http://www.XXXXX.com</a></p>
                            </div>
                        </dd>
                    </dl>
                    <div class="wx">
                        <img src="images/weixin.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="ft_bottom wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s">
            <div class="main">
            壹号贝贝· 长泰沐橦店  版权所有 Copyright ©2018-2019 备案号：闽ICP备88888888号</div>
        </div>
    </footer>

