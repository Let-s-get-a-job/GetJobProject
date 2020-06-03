<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<article>
<div class="container">
	<h2>글 조회</h2>
    <form id="viewForm" name="viewForm" method="post">
        <div class="mb-3">
			    <label for="title">제목</label>
                        <input class="form-control" type="text" id="title" name="title" value="${result.title }" readonly/>
        </div>
 		 <div class="mb-3">
                      <label for="content">내용</label>
                        <textarea class="form-control" rows="10" cols="10" id="content" name="content" readonly><c:out value="${result.content }"/></textarea>
                        </div>
             <div class="mb-3">      
                     	<label for="writer">작성자</label>
                       <input class="form-control" type="text" id="writer" name="writer" value="${result.writer }" readonly/>
               </div>
                <div>
                <c:if test="${member.m_name == result.writer}">
                    <a href='<c:url value='/board/update'/>${vo.makeQuery()}&id=${result.id}' class="btn btn-primary pull right">수정</a>
                    <a href='<c:url value='/board/boardDelete.do'/>${vo.makeQuery()}&id=${result.id}' class="btn btn-primary pull right">삭제</a>
                </c:if>    
                    <a href='<c:url value='/listPage'/>${vo.makeQuery()}' class="btn btn-primary pull right">목록</a>
                                       
                </div>
            

        <input type='hidden' id='id' name='id' value='${result.id}' />
    </form>
    
    <!-- Reply Form {s} -->
	<c:if test="${not empty member}">
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">

				<form:hidden path="id" id="id"/>

				<div class="row">

					<div class="col-sm-10">

						<textarea path="rp_content" id="rp_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>

					</div>

					<div class="col-sm-2">

						<input type="text" path="rp_writer" class="form-control" id="rp_writer" value = "${member.m_id}" readonly>

						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>

					</div>

				</div>

				</form:form>

			</div>

			<!-- Reply Form {e} -->

			

			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply List</h6>

				<div id="replyList"></div>

			</div> 

			<!-- Reply List {e}-->
   </c:if>
   <c:if test="${empty member}">
   <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
  <center> 	<h2>로그인 하셔야 댓글을 작성하실 수 있습니다.</h2></center>
  <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply List</h6>

				<div id="replyList"></div>

			</div> 
   </div>
   </c:if>
<script>
$(document).ready(function(){

	showReplyList();

});

$(document).on('click', '#btnReplySave', function(){

	var replyContent = $('#rp_content').val();

	var replyWriter = $('#rp_writer').val();

	var url = "<c:url value='/registerReqly'/>";

	var paramData = JSON.stringify({"rp_content": replyContent

			, "rp_writer": replyWriter

			, "id":'${result.id}'

	});

	

	var headers = {"Content-Type" : "application/json"

			, "X-HTTP-Method-Override" : "POST"};

	

	$.ajax({

		url: url

		, headers : headers

		, data : paramData

		, type : 'POST'

		, dataType : 'text'

		, success: function(result){

			showReplyList();

			

			$('#rp_content').val('');

		}

		, error: function(error){

			console.log("에러 : " + error);

		}

	});

});


/*
//목록
function fn_cancel(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}
 
//수정
function fn_update(id){
    
    var form = document.getElementById("viewForm");
    var url ="<c:url value='/board/updateboard.do'/>";
    url = url + "?id=" + id;
    form.action = url;
    form.submit();
}

//삭제
function fn_delete(id){
	
	var form = document.getElementById("viewForm");
	var url = "<c:url value='/board/boardDelete.do'/>";
    url = url + "?id=" + id;
    form.action = url;
	form.submit();
}
 */

 function showReplyList(){

		var url = "<c:url value='/listReplyPage'/>";

		var paramData = {"id" : "${result.id}"};
		
		var member = "${member.m_id}";
		

			
			$.ajax({

		         type: 'POST',

		         url: url,

		         data: paramData,

		         dataType: 'json',

		         success: function(result) {

		            	var htmls = "";

					if(result.length < 1){

						htmls+=("등록된 댓글이 없습니다.");

					} else {

			                    $(result).each(function(){
			                    	
			                    	console.log(member);

			                     htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';

			                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

			                     htmls += '<title>Placeholder</title>';

			                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

			                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

			                     htmls += '</svg>';

			                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

			                     htmls += '<span class="d-block">';

			                     htmls += '<strong class="text-gray-dark">' + this.rp_writer + '</strong>';

			                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			                     
								if(member == this.rp_writer)		                     
			             		{
			                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.rp_writer + '\', \'' + this.rp_content + '\' )" style="padding-right:5px">수정</a>';

			                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >삭제</a>';
			             		}

			                     htmls += '</span>';

			                     htmls += '</span>';

			                     htmls += this.rp_content;

			                     htmls += '</p>';

			                     htmls += '</div>';



			                });	//each end
					}

					$("#replyList").html(htmls);    

		         }	   // Ajax success end

				});	// Ajax end
			
		
	}


 function fn_editReply(rid, rp_writer, rp_content){

		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="rid' + rid + '">';

		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

		htmls += '<title>Placeholder</title>';

		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

		htmls += '</svg>';

		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

		htmls += '<span class="d-block">';

		htmls += '<strong class="text-gray-dark">' + rp_writer + '</strong>';

		htmls += '<span style="padding-left: 7px; font-size: 9pt">';

		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rid + ', \'' + rp_writer + '\')" style="padding-right:5px">저장</a>';

		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

		htmls += '</span>';

		htmls += '</span>';		

		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

		htmls += rp_content;

		htmls += '</textarea>';

		

		htmls += '</p>';

		htmls += '</div>';

		

		$('#rid' + rid).replaceWith(htmls);

		$('#rid' + rid + ' #editContent').focus();

	}

 
 function fn_updateReply(rid, rp_writer){

		var replyEditContent = $('#editContent').val();

		var url = "<c:url value='/updateReply'/>";

		var paramData = JSON.stringify({"rp_content": replyEditContent

				, "rid": rid

		});

		

		var headers = {"Content-Type" : "application/json"

				, "X-HTTP-Method-Override" : "POST"};

		

		$.ajax({

			url: url

			, headers : headers

			, data : paramData

			, type : 'POST'

			, dataType : 'text'

			, success: function(result){

                             console.log(result);

				showReplyList();

			}

			, error: function(error){

				console.log("에러 : " + error);

			}

		});

	}
 function fn_deleteReply(rid){

		var paramData = {"rid": rid};
		var url = "<c:url value='/deleteReply'/>";
		

		$.ajax({

			url: url

			, data : paramData

			, type : 'POST'

			, dataType : 'text'

			, success: function(result){

				showReplyList();

			}

			, error: function(error){

				console.log("에러 : " + error);

			}

		});

	}


 
</script>
</div>
 </article>
</body>
</html>