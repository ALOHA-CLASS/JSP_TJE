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
		<h1 class="display-5 fw-bold text-body-emphasis">JSON & XML 요청 및 응답</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">JSON & XML 컨텐츠 타입으로 요청 및 응답 받기</p>
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
				      <input type="text" class="form-control" id="input-json1" name="name" placeholder="이름" autofocus>
				      <label for="input-json1">이름</label>
				    </div>
				    <div class="form-floating">
				      <input type="text" class="form-control" id="input-json2" name="age" placeholder="나이">
				      <label for="input-json2">나이</label>
				    </div>
				    
				    <a href="javascript:;" class="btn btn-outline-primary btn-lg px-4 w-100" id="btn-json">JSON 요청</a>
				</form>
				
				<hr>

				<textarea name="" id="result-json" rows="5" class="form-control" placeholder="응답 결과"></textarea>

				<div class="row">
					<div class="col">
						<input type="text" class="form-control" id="output-json1" name="name" placeholder="이름" autofocus>
					</div>
					<div class="col">
						<input type="text" class="form-control" id="output-json2" name="age" placeholder="나이">
					</div>
				</div>
				
				
			</div>
			<div class="col">
				<form action="" method="post">
				    <div class="form-floating">
				      <input type="text" class="form-control" id="input-xml1" name="name" placeholder="이름" autofocus>
				      <label for="input-json1">이름</label>
				    </div>
				    <div class="form-floating">
				      <input type="text" class="form-control" id="input-xml2" name="age" placeholder="나이">
				      <label for="input-json2">나이</label>
				    </div>
				    <a href="javascript:;" class="btn btn-outline-primary btn-lg px-4 w-100" id="btn-xml">XML 요청</a>
				</form>

				<hr>

				<textarea name="" id="result-xml" rows="5" class="form-control" placeholder="응답 결과"></textarea>

				<div class="row">
					<div class="col">
						<input type="text" class="form-control" id="output-xml1" name="name" placeholder="이름" autofocus>
					</div>
					<div class="col">
						<input type="text" class="form-control" id="output-xml2" name="age" placeholder="나이">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	
	<script>
	
		let btnJSON = document.getElementById('btn-json')
		let btnXML = document.getElementById('btn-xml')
		
		btnJSON.addEventListener('click', function() {
			// alert('json')	

			let request = new XMLHttpRequest()
			let result = {}
			
			let inputName1 = document.getElementById('input-json1')
			let inputAge1 = document.getElementById('input-json2')

			let data = {
                'name' : inputName1.value,
                'age' : inputAge1.value,
            }

            // 응답 확인
            request.onreadystatechange = function() {
                // 요청 성공
                if( request.readyState == request.DONE && request.status == 200 ) {
                    let response = request.responseText
                    // alert(response)
					// JSON.parse() : text --> JSON 변환
                    result = JSON.parse(response)
					console.log(result.name);
					console.log(result.age);

					let text = document.getElementById('result-json')
					let jsonName = document.getElementById('output-json1')
					let jsonAge = document.getElementById('output-json2')

					text.textContent = response
					jsonName.value = result.name
					jsonAge.value = result.age
                }

                // 에러 발생
                if( request.readyState == request.DONE && request.status == 500 ) {
                    alert('서버측 에러 발생')
                }
            }

            // 요청 설정
            let url = 'http://127.0.0.1:9090/json'

            request.open("POST", url, true)
            request.setRequestHeader("Content-Type", "application/json")

            // JSON.stringify() : JavaScript 의 객체를 JSON 문자열로 변환하는 메소드
            request.send( JSON.stringify(data) )
			
		})
		
		
		btnXML.addEventListener('click', function() {
			// alert('xml')	
			let inputName2 = document.getElementById('input-xml1')
			let inputAge2 = document.getElementById('input-xml2')

			let request = new XMLHttpRequest()
			let result = {}
			
			let data = '<user>\n'
                     + '<name>' + inputName2.value + '</name>\n'
                     + '<age>' + inputAge2.value + '</age>\n'
                     + '</user>\n'
					 
			// 응답 확인
            request.onreadystatechange = function() {
                // 요청 성공
                if( request.readyState == request.DONE && request.status == 200 ) {
                    let response = request.responseText
                    // alert(response)

                    result = xmlToObject(response)
					console.log(result.name);
					console.log(result.age);

					let text = document.getElementById('result-xml')
					let xmlName = document.getElementById('output-xml1')
					let xmlAge = document.getElementById('output-xml2')

					text.textContent = response
					xmlName.value = result.name
					xmlAge.value = result.age
                }

                // 에러 발생
                if( request.readyState == request.DONE && request.status == 500 ) {
                    alert('서버측 에러 발생')
                }
            }

            // 요청 설정
            let url = 'http://127.0.0.1:9090/xml'

            request.open("POST", url, true)
            request.setRequestHeader("Content-Type", "application/xml")

            request.send( data )

		})
	

		// XML 문자열을 객체로 변환
		function xmlToObject(xmlString) {
			// DOMParser를 사용하여 XML 문자열을 파싱
			var parser = new DOMParser();
			var xmlDoc = parser.parseFromString(xmlString, 'text/xml');

			// XML에서 필요한 데이터를 추출
			var name = xmlDoc.getElementsByTagName('name')[0].textContent;
			var age = parseInt(xmlDoc.getElementsByTagName('age')[0].textContent);

			// 추출한 데이터를 JavaScript 객체로 저장
			var user = {
				name: name,
				age: age
			};

			return user
		}
	
	</script>
</body>
</html>
























