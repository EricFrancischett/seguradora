<!DOCTYPE html>
<!-- veiIncluir.php -->
<html>
<head>

	<title>Seguradora</title>
	<link rel="icon" type="image/png" href="imagens/favicon1.png" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="css/customizes.css">
</head>
<body onload="w3_show_nav('menuVeiculo')">
	<!-- Inclui MENU.PHP  -->
	<?php require 'geral/menu.php'; ?>
	<?php require 'bd/conectaBD.php'; ?>

	<!-- Conteúdo Principal: deslocado paa direita em 270 pixels quando a sidebar é visível -->
	<div class="w3-main w3-container" style="margin-left:270px;margin-top:130px;">

		<div class="w3-panel w3-padding-large w3-card-4 w3-light-grey">
			<!-- h1 class="w3-xxlarge">Contratação de Veículo</h1 -->
			<p class="w3-large">
			<div class="w3-code cssHigh notranslate">
				<!-- Acesso em:-->
				<?php

				date_default_timezone_set("America/Sao_Paulo");
				$data = date("d/m/Y H:i:s", time());
				echo "<p class='w3-small' > ";
				echo "Acesso em: ";
				echo $data;
				echo "</p> "
				?>
				<!-- Acesso ao BD-->
				<?php
				// Cria conexão
				$conn = new mysqli($servername, $username, $password, $database);

				// Verifica conexão 
				if ($conn->connect_error) {
					die("<strong> Falha de conexão: </strong>" . $conn->connect_error);
				}

				// Obtém as Especialidades Médicas na Base de Dados para um combo box
				$sqlG = "SELECT id_sinistro, nome_sinistro FROM sinistro";
				$result = $conn->query($sqlG);
				$optionsSinist = array();

				if ($result->num_rows > 0) {
					while ($row = $result->fetch_assoc()) {
						array_push($optionsSinist, "\t\t\t<option value='" . $row["id_sinistro"] . "'>" . $row["nome_sinistro"] . "</option>\n");
					}
				} else {
					echo "Erro executando SELECT: " . $conn->connect_error;
				}
				$conn->close();
				?>
				<div class="w3-responsive w3-card-4">
					<div class="w3-container w3-theme">
						<h2>Informe os dados do novo do Veiculo</h2>
					</div>
					<form class="w3-container" action="veiIncluir_exe.php" method="post" enctype="multipart/form-data">
						<table class='w3-table-all'>
						<tr>
						<td style="width:50%;">
						<p>
							<label class="w3-text-IE"><b>Marca/Modelo</b>*</label>
							<input class="w3-input w3-border w3-light-grey" name="Marca/Modelo" type="text" pattern="[a-zA-Z\u00C0-\u00FF ]{10,100}$" title="Marca/Modelo entre 10 e 100 letras." required>
						</p>
						<p>
							<label class="w3-text-IE"><b>Cor</b></label>
							<input class="w3-input w3-border w3-light-grey " name="Cor" id="CRM" type="text" maxlength="20" placeholder="Cor" title="Cor">
						</p>
						<p>
							<label class="w3-text-IE"><b>Ano</b>*</label>
							<input class="w3-input w3-border w3-light-grey" name="Ano" type="year" placeholder="aaaa" title="aaaa" maxlength="4"></p>
						<p><label class="w3-text-IE"><b>Sinistro</b>*</label>
							<select name="Sinistro" id="Sinistro" class="w3-input w3-border w3-light-grey" required>
								<option value=""></option>
								<?php
								foreach ($optionsSinist as $key => $value) {
									echo $value;
								}
								?>
							</select>
						</p>
						</td>
						<td>
						<p style="text-align:center"><label class="w3-text-IE"><b>Imagem para Identificação: </b></label></p>
						<p style="text-align:center"><img id="imagemSelecionada" src="imagens/carro.jpg" /></p>
						<p style="text-align:center"><label class="w3-btn w3-theme">Selecione uma Imagem</label>
								<input type="hidden" name="MAX_FILE_SIZE" value="16777215" />
								<input type="file" id="Imagem" name="Imagem" accept="imagem/*" onchange="validaImagem(this);"> 
						</p>
						</td>
						</tr>
						<tr>
						<td colspan="2" style="text-align:center">
						<p>
							<input type="submit" value="Salvar" class="w3-btn w3-theme">
							<input type="button" value="Cancelar" class="w3-btn w3-theme" onclick="window.location.href='veiListar.php'">
						</p>
						</td>
						</tr>
						</table>
					</form>
					<br>
				</div>
			</div>
			</p>
		</div>

		<?php require 'geral/sobre.php'; ?>
		<!-- FIM PRINCIPAL -->
	</div>
	<!-- Inclui RODAPE.PHP  -->
	<?php require 'geral/rodape.php'; ?>
</body>
</html>