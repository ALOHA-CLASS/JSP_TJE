<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSON & XML</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<% String root = request.getContextPath(); %>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">Chat GPT - Open AI API</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Open AI API 사용하기</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			</div>
		</div>
	</div>
	<!-- 입력 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<form action="" method="post">
				    <div class="form-floating">
				      <input type="text" class="form-control" id="input-msg" name="msg" placeholder="무엇이 궁금한가요?" autofocus>
				      <label for="input-msg">채팅 메시지</label>
				    </div>
				    
				    <a href="javascript:;" class="btn btn-outline-primary btn-lg px-4 w-100" id="btn">요청하기</a>
				</form>
				
				<hr>

				<div class="row">
					<div class="col">
						<textarea name="" id="result" rows="20" class="form-control" placeholder="응답 결과"></textarea>
					</div>
					<div class="col">
						<textarea name="" id="content" rows="20" class="form-control" placeholder="내용"></textarea>
					</div>
				</div>

			</div>
			
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	
	<script>
	
		let btn = document.getElementById('btn')
		let API_KEY = ''

		if( API_KEY == '' ) {
			alert('API_KEY 를 변수에 입력하세요.')
		}
		
		btn.addEventListener('click', function() {

			let request = new XMLHttpRequest()
			let result = document.getElementById('result')
			let content = document.getElementById('content')
			
			let msg = document.getElementById('input-msg').value

			let data = {
				"model": "gpt-3.5-turbo",
				"messages": [
					{
					"role": "user",
					"content": msg
					}
				],
				"temperature": 1,
				"max_tokens": 256,
				"top_p": 1,
				"frequency_penalty": 0,
				"presence_penalty": 0
			}

            // 응답 확인
            request.onreadystatechange = function() {
                // 요청 성공
                if( request.readyState == request.DONE && request.status == 200 ) {
                    let response = request.responseText
                    // alert(response)
					// JSON.parse() : text --> JSON 변환
                    // result = JSON.parse(response)

					// 전체 응답 메시지 (JSON)
					result.textContent = response

					// JSON 문자열 -> 객체
					let object = JSON.parse(response)
					let contentValue = object.choices[0].message.content

					// 응답 메시지 중, 채팅 답변만
					content.textContent = contentValue


                }

                // 에러 발생
                if( request.readyState == request.DONE && request.status == 500 ) {
                    alert('서버측 에러 발생')
                }
            }

            // 요청 설정
            let url = 'https://api.openai.com/v1/chat/completions'

            request.open("POST", url, true)
            request.setRequestHeader("Content-Type", "application/json")
			request.setRequestHeader("Authorization", "Bearer " + API_KEY)

            // JSON.stringify() : JavaScript 의 객체를 JSON 문자열로 변환하는 메소드
            request.send( JSON.stringify(data) )
			
		})
		
		
	
	</script>
</body>
</html>
























