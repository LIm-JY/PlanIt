<form class="w3-container" id="regForm" method="post" enctype="multipart/form-data">
<div class="w3-section">
			<label>Email</label> 
			<input class="w3-input w3-border w3-hover-border-black" style="width: 50%;"
				type="email" name="uid" id = "uid" required>
            <input type="checkbox" name="idchk" id="idchk">
			<input type="hidden" name="idpwchk" id="idpwchk">
		</div>
</form>
<style>

.check_ok {color: blue;}

.check_not {color: red;}

#idpwchk{display: none;}
    
</style>
<script>
$(document).ready(function() {

		$('#loginForm').submit(function() {
			if (!$('#idpwchk').prop('checked')) {
				$('#uid').focus();
				return false;
			}
		});
		$('#uid').focusin(function() {
			$(this).val('');
			$('#idpwchk').prop('checked', false);체크가 f 면
			$('#checkmsg').text('');             체크메세지는 ''를 내보낼거어ㅑ
			$('#checkmsg').removeClass('check_not'); 
			$('#checkmsg').removeClass('check_ok');
		});

		$('#uid').focusout(function() {
			if ($(this).val().length < 1) {           이 밸류의 길이가 0이라면 
				$('#checkmsg').text("이메일을 입력해주세요.");        체크메세지에 이렇게 하고
				$('#checkmsg').addClass('check_not');       체크낫으로 하고, f를 내보내자
				return false;
			}

			//ajax 비동기 통신

			$.ajax({
				url : 'login',  /*url  -> login/login*/
				data : {
					uid : $(this).val()
				},
				success : function(data) {
					if (data == 'N') {
						$('#checkmsg').text("사용중인 이메일입니다.");
						$('#checkmsg').addClass('check_not');
						$('#idchk').prop('checked', false);
						
					} else {
						
                        $('#checkmsg').addClass('check_ok');
						$('#idchk').prop('checked', true);
					}
				}
			});
		});

		
		});

	});

</script>