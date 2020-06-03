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
	<h2>글수정</h2>
    <form id="updateForm" name="updateForm" action="<c:url value='/board/updateboard.do'/>${vo.makeQuery()}"+"&id="+${result.id}" method="post" >

                <div class="mb-3">
			    <label for="title">제목</label>
                        <input class="form-control" type="text" id="title" name="title" value="${result.title}"/>
        </div>
 		 <div class="mb-3">
                      <label for="content">내용</label>
                        <textarea class="form-control" rows="10" cols="10" id="content" name="content"><c:out value="${result.content }"/></textarea>
                        </div>
             <div class="mb-3">      
                     	<label for="writer">작성자</label>
                    
                       <input class="form-control" type="text" id="writer" name="writer" value="${result.writer}" readonly/>
                    
               </div>
                <div>
                    <input type="submit" class="btn btn-primary pull right" value="수정">
                    <a href='<c:url value='/listPage'/>${vo.makeQuery()}' class="btn btn-primary pull right">취소</a>
                </div>
            <input type='hidden' id='id' name='id' value='${result.id}' />
    </form>
   
<script>
/*
//수정
function fn_updateBoard(query,id){
    
    var form = document.getElementById("updateForm");
    var url = "<c:url value='/board/updateboard.do'/>";
    form.action = url + "$" + query + "$id=" + id;
    form.submit();
    
}
*/
 /*
//목록
function fn_cancel(){
    
    var form = document.getElementById("updateForm");
    
    form.action = "<c:url value='/listPage'/>";
    form.submit();
    
}
*/
</script>
</div>
 </article>
</body>
</html>