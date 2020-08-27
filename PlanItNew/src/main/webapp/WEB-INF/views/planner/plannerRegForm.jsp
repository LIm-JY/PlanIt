<%@ page import="com.aia.it.planner.model.PlannerJoinDaily"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">
	
		<!-- 모달  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	

		 <!-- jquery  -->
 	<!-- <script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
 	 	<script src="http://code.jquery.com/jquery-1.7.js"></script>
 	
 	
	<!-- <script>
 	 var jq = jQuery.noConflict();
	</script> -->
 
		<!-- SORTABLE  -->
	<!-- <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script> 
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script> -->
	



	<!-- SORTABLE  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
<!-- 	<script>
 	 var st = jQuery.noConflict();
	</script> -->
	

<style>

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<style>

.sortable{

	border: 0.5px solid black;
	text-align: center;
	width : 500px;
	
}

</style>

<title>플래너 작성</title>
</head>




<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>




	<a type="submit" onclick="editDailyOrder();">에디트 저장</a>
	
  <div id="dailyModal" class="modal" >
  
  	<h2>데일리 작성</h2>
  
   <form id="dailyRegForm" onsubmit="return false;" >
   <%-- action="<c:url value='/planner/dailyList'/>" --%>    
		pidx		<input type="text" name="pidx" value="${planner.pidx}" id="pidx">	<br>

		dloc		<input type="text" name="dloc" >	<br>
		dloclon		<input type="text" name="dloclon" id="dloclon"><br>
		dloclat		<input type="text" name="dloclat" id="dloclat"><br>
		dmsg		<input type="text" name="dmsg" id="dmsg"><br>
		dphoto		<input type="file" name="dphoto" id="dphoto"><br>
		dtype		<select name="dtype" id="dtype">
					<option value="red">빨강</option>
					<option value="blue">파랑</option>
					<option value="green">초록</option>
					<option value="pink">분홍</option>
					<option value="white">하양</option>
					</select>
					<br>
		ddate(날짜)	<input type="text" name="ddate" id="ddate"><br>
		ddidx(날짜순서)<input type="text" name="ddidx" id="ddidx"><br>
		
		
			<input type="submit" value="제출" onclick="regDaily(); ">
</form>

<div class="map_wrap" style="height:500px">
    <!-- <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> -->
    <div id="map" style="height:500px;position:relative;overflow:hidden;"> 클릭1 </div>

    <div id="menu_wrap" class="bg_white">클릭2
        <div class="option">클릭3
            <div>
                <form onsubmit="searchPlaces(); return false;">클릭4
                    키워드 : <input type="text" value="종각 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
            <input type="submit" onclick="showItemEl();" name="back" value="검색">
    
    <hr>
    <span id="Lat"></span>
	<span id="Lng"></span>
    
</div>



        <a href="#" rel="modal:close">닫기</a>
      </div>
       
      

	
	
		pidx <input type="text" name="pidx" value="${pidx}"><br>
	uidx <input type="text" name="uidx" value="${loginInfo.uidx}"><br>
	<input type="text" name="pstartdate" value="${startdate}">/<input type="text" name="penddate" value="${enddate}"><br>
	제목<input type="text" name="ptitle" value="${ptitle}">
		<div id="sortable">
			<c:forEach items="${dateList}" var="list">
				<div class="sortable" name="dailytable">
				
					<div class="ddateList" class="sortable"><input type="text" class="dayOfPlan" value="${list}"></div>
					<div class="sortable"></div>
					<div class="addDailyButton" ><a href=#dailyModal rel="modal:open">+</a></div>
					<%-- <a href="<c:url value="/daily/dailyReg"/>"> --%>
				</div>
			</c:forEach>
		</div>
		
		<span id="dailyList"></span>
	




	

	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

	



<!-- 비동기 통신  -->

	<script type="text/javascript">

		 $(document).ready(function(){
			
			dailyList();
			
		}); 
		 
		
		 /* 데일리 리스트 출력 */
		 	function dailyList() {
			
			$.ajax({
				url: 'http://localhost:8080/it/planner/dailyRest',
				type: 'GET',
				
				data: {
					uidx : '${loginInfo.uidx}',
					pidx : '${pidx}'
				},
				success: function(data){
			var html = '';
			
		console.log(data);
		console.log(data[1].ptitle);

		
/* 		var sortable = document.getElementsByClassName("sortable");
 */		
		
		
		console.log($(document.getElementsByClassName("ddateList")).html());
		
/* 		var ddate = $(document.getElementsByClassName("ddateList"));
 */		
		


		for(var i=0; i<data.length; i++){
					
				 	html += '<div class="sortableBox" class="sortable">';
				 
					html += '	<div class="sortable" >'; 
					html += '		<input type="text" class="ddidx" value="'+data[i].ddidx+'">';
					html += '		<input type="text" class="ddate" id="ddate" value="'+data[i].ddate+'">';
					html += '		<input type="text" class="didx" value="'+data[i].didx+'">';
					html += '		<input type="text" value="'+data[i].dloc+'">';
					html += '		<input type="text" value="'+data[i].dloclon+'">';
					html += '		<input type="text" value="'+data[i].dloclat+'">';
					html += '		<input type="text" value="'+data[i].dphoto+'">';
					html += '		<input type="text" value="'+data[i].dtype+'">';
					
					html += '		<input type="text" value="'+data[i].pidx+'">';
					html += '	</div>';
					html += '	<a href="https://map.kakao.com/?sName=%27+종각+%27&eName=%27+홍대입구역 2호선">경로찾기</a>';
					//kakaomap://route?sp=37.51119865054613,127.02165424220854&ep=37.5705756133826,126.98531278713301&by=PUBLICTRANSIT
					
 					html += '</div>'; 
					/* console.log($('.dayOfPlan').eq(i).val()); */
					/* console.log(data[i].ddate); */
					
					for(var j=0; j<$('.dayOfPlan').length;j++)
						
					if($('.dayOfPlan').eq(j).val() == data[i].ddate){
						$('.dayOfPlan').eq(j).parent('div').next().append(html);
					}
					
					
					/* $( '.ddateList:contains("'+data[i].ddate+'")').next().append(html); */
					/* $('#dailyList').append(html); */
					html='';

					}
		reorder();
				}
			});
		}
		
		 	/* 데일리 등록 */
			function regDaily(){
				
				var regFormData = new FormData();
				regFormData.append('pidx', $('#pidx').val());
				regFormData.append('dloc', $('#dloc').val());
				regFormData.append('dloclon', $('#dloclon').val());
				regFormData.append('dloclat', $('#dloclat').val());
				regFormData.append('dmsg', $('#dmsg').val());
				/* regFormData.append('dphoto', $('#dphoto').val()); */

				// 파일 첨부
				 if($('#dphoto')[0].files[0] != null){
					regFormData.append('dphoto',$('#dphoto')[0].files[0]);
				} 
				regFormData.append('dtype', $('#dtype').val());
				regFormData.append('ddate', $('#ddate').val());
				regFormData.append('ddidx', $('#ddidx').val());
				
				console.log(regFormData);
				console.log($('#ddate').val());
				$.ajax({
					url : 'http://localhost:8080/it/planner/dailyRest',
					type : 'post',
					processData: false, // File 전송시 필수
					contentType: false, // multipart/form-data
					data : regFormData,
					
					success : function(data){
						alert(data); 
						dailyList();
						document.getElementById('dailyRegForm').reset();
						

					}
				});
				
			}
		
		 	/* 데일리 순서 등록 */
/* 		function editDailyOrder(){
				
				var DailyOrderEdit = new FormData();
				
				
				
				 for(var i=0; i<=$('.didx').length-1;i++){
					 
					 DailyOrderEdit.append('DailyOrderEdit['+i+'].didx', $('.didx').eq(i).val());
					 DailyOrderEdit.append('DailyOrderEdit['+i+'].ddate', $('.ddate').eq(i).val());
					 DailyOrderEdit.append('DailyOrderEdit['+i+'].ddidx', $('.ddidx').eq(i).val());
				
				console.log($('.ddidx').eq(i).val());
				} 
				
				 
				 $.ajax({
					url : 'http://localhost:8080/it/planner/dailyOrderEdit',
					type : 'post',
					datatype : 'json',
					data : DailyOrderEdit,
					
					success : function(data){
						alert(data); 
						

					}
				}); 
				
			} */
			
			/* 데일리등록 낱개 연습  */
		function editDailyOrder(){
			
				
				/* regFormData.append('didx', $('.didx').val()); */
			/* 	regFormData.append('ddate', $('.ddate').val());
				regFormData.append('ddidx', $('.ddidx').val());
				
				console.log($('.ddate').val());
				console.log($('.ddidx').val());			
				regFormData.get(ddidx);
				regFormData.get(ddate);	 */	
				
				
				
			
			
			 $.ajax({  
				url : 'http://localhost:8080/it/planner/dailyOrderEdit/'+$('.didx').val(),
				type : 'post',

				data : {
					didx : $('.didx').val() ,
					ddate : $('.ddate').val() ,
					ddidx : $('.ddidx').val()
					
				},
				
				success : function(data){
					alert(data); 
					

				}
			}); 
			
		}
			
			
			
			
			
			

</script>
	
	<!-- 지도API  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b554607ceeb060d931e9eedfa0d54dc&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();

function resizeMap() {
    var mapContainer = document.getElementById('map');
    mapContainer.style.width = '350px';
    mapContainer.style.height = '450px'; 
}


function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}
function setCenter() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}     




resizeMap();
relayout();

function zoomIn() {        
    // 현재 지도의 레벨을 얻어옵니다
    var level = map.getLevel();
    
    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
    map.setLevel(level - 9);
    
    
}    



// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    
    
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                                                        
                var content = '<div class="bAddr">' +
                                '<span class="title">주소정보</span>' + 
                                detailAddr +
                            '</div>'
                            
                            ;
                            
                            
                            
                            
                            
                         
                // 마커를 클릭한 위치에 표시합니다 
                marker.setPosition(mouseEvent.latLng);
                
                marker.setMap(map);
			

                infowindow.setContent(content);
                infowindow.open(map, marker); 
                $('#dloclon').val(marker.getPosition().getLng());
                $('#dloclat').val(marker.getPosition().getLat());

                relayout();
                var moveLatLon = new kakao.maps.LatLng(marker.getPosition().getLat(),marker.getPosition().getLng());
                map.panTo(moveLatLon);
                
                
                
            }   
        });
    });
    
    
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        
         
             //마크 클릭
       (function(marker, title) {
            kakao.maps.event.addListener(marker, 'click', function() {
                displayInfowindow(marker, title);
                
                $('#dloclat').val(marker.getPosition().getLat());
                $('#dloclon').val(marker.getPosition().getLng());
                console.log('1번');
                relayout();
            	map.setLevel(4);    
  				var moveLatLon = new kakao.maps.LatLng(marker.getPosition().getLat(),marker.getPosition().getLng());
                map.panTo(moveLatLon);

            }); 

            
         
            //목록에서 클릭
            itemEl.onclick =  function () {
                displayInfowindow(marker, title);
                
                $('#dloclat').val(marker.getPosition().getLat());
                $('#dloclon').val(marker.getPosition().getLng());
                
                $("#menu_wrap").css("display","none");
                
                console.log('2번');

                relayout();
            	map.setLevel(4);    
                var moveLatLon = new kakao.maps.LatLng(marker.getPosition().getLat(),marker.getPosition().getLng());
                map.panTo(moveLatLon);
                
                
                }; 
            
                /*    kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            }); */

            /*  itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };  */
            
                
                
                
                
                
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
    
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}



var showItemEl = function() {
	$("#menu_wrap").css("display","block");
	
	
};


// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
 

 

</script>
	<script>

	/* @@@@SORTABLE@@@@ */
	
	
	/** UI 설정 */ 
	$(function() {
		$(".sortable").sortable({
			placeholder : "itemBoxHighlight",
			connectWith : ".ddateList, .sortableBox, .sortable.ui-sortable",
			
			start : function(event, ui) {
				ui.item.data('start_pos', ui.item.index());
			},
			stop : function(event, ui) {
				var spos = ui.item.data('start_pos');
				var epos = ui.item.index();
				 	reorder();  //순서 조정
				 
				 	
				 
				 editDailyOrder();

			}
			

			
			
		});
		$("#sortable").disableSelection();
		
	});

	
	/* 순서 조정 */
	function reorder() {
	   $(".sortableBox").each(function(i, box) {
	        $(box).find(".ddidx").val(i + 1);

	    });
	/*  $(".sortableBox").each(function(i, box) {
		console.log($(".dayOfPlan").eq(i).val());
		 $(box).find(".ddate").val($(".dayOfPlan").eq(i).val()); 
	
	    }); */

	
		for(var i=0; i<$(".dayOfPlan").length; i++){
					
		$(".dayOfPlan").eq(i).parent('div').next('div').find("input.ddate").val($(".dayOfPlan").eq(i).val());
		
		}
	    
		
	}
	
</script>
	
	
	
</body>
</html>

