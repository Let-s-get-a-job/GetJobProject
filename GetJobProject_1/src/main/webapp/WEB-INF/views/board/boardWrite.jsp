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
	<h2>글쓰기</h2>
    <form id="writeForm" name="writeForm" method="post">
     
            
            
                <div class="mb-3">
			    <label for="title">제목</label>
                        <input class="form-control" type="text" id="title" name="title"/>
        </div>
 		 <div class="mb-3">
                      <label for="content">내용</label>
                        <textarea class="form-control" rows="10" cols="10" id="content" name="content"></textarea>
                        </div>
             <div class="mb-3">      
                     	<label for="writer">작성자</label>
                    
                       <input class="form-control" type="text" id="writer" name="writer" value="${member.m_id}" readonly/>
                    
               </div>
                <div>
                    <a href='#' onClick='fn_addtoBoard()' class="btn btn-primary pull right">글 등록</a>
                    <a href='#' onClick='fn_cancel()' class="btn btn-primary pull right">목록</a>
                </div>
            
    </form>
   
<script>
//글쓰기
function fn_addtoBoard(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='/board/write.do'/>";
    form.submit();
    
}
 
//목록
function fn_cancel(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='/listPage'/>";
    form.submit();
    
}
</script>
</div>
 </article>
</body>
</html>