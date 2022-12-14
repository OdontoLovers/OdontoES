Feature: consulta
  As a Administrador
  I want to marcar uma consulta
  So that um paciente possa se consultar com o dentista

  Scenario: Nova consulta
    Given estou logado com o administrador com o usuario 'admin@admin.com' e senha '987654321'
    And que existe um paciente de Nome 'José Daniel Florêncio Duarte Filho', Data de Nascimento '17/02/2001', CPF '013.862.694-41', Email 'danielduartefilho.df@gmail.com' e Senha '123456'
    And que existe um dentista de Nome 'Vinicius', Telefone '81971133619', CRO '12345', CPF '070.126.704-60', Especialidade 'Ortodondia'
    And estou na tela de criar Consulta
    When eu seleciono o paciente de Nome 'José Daniel Florêncio Duarte Filho', Dentista 'Vinicius', Horario '07/10/2022 - 10:00'
    And clico em Create Consultum
    Then eu vejo a mensagem 'Consultum was successfully created.'

  Scenario: Criar uma consulta com data invalida
    Given estou logado com o administrador com o usuario 'admin@admin.com' e senha '987654321'
    And que existe um paciente de Nome 'José Daniel Florêncio Duarte Filho', Data de Nascimento '17/02/2001', CPF '013.862.694-41', Email 'danielduartefilho.df@gmail.com' e Senha '123456'
    And que existe um dentista de Nome 'Alex Lopes', Telefone '81971133619', CRO '12345', CPF '070.126.704-60', Especialidade 'Ortodondia'
    And estou na tela de criar Consulta
    When eu seleciono o paciente de Nome 'José Daniel Florêncio Duarte Filho', Dentista 'Alex Lopes', Horario '07/10/2020 - 10:00'
    And clico em Create Consultum
    Then eu vejo a mensagem 'Data hora Data e hora não podem ser no passado.'

  Scenario: Criar uma consulta com horario invalido
    Given estou logado com o administrador com o usuario 'admin@admin.com' e senha '987654321'
    And que existe um paciente de Nome 'José Daniel Florêncio Duarte Filho', Data de Nascimento '17/02/2001', CPF '013.862.694-41', Email 'danielduartefilho.df@gmail.com' e Senha '123456'
    And que existe um dentista de Nome 'Antonio', Telefone '81971133619', CRO '12345', CPF '070.126.704-60', Especialidade 'Ortodondia'
    And estou na tela de criar Consulta
    When eu seleciono o paciente de Nome 'José Daniel Florêncio Duarte Filho', Dentista 'Antonio', Horario '07/10/2022 - 14:00'
    And clico em Create Consultum
    Then eu vejo a mensagem 'Data hora Horário fora do horário do dentista.'

  Scenario: Editar consulta
    Given estou logado com o administrador com o usuario 'admin@admin.com' e senha '987654321'
    And que existe um paciente de Nome 'José Daniel Florêncio Duarte Filho', Data de Nascimento '17/02/2001', CPF '013.862.694-41', Email 'danielduartefilho.df@gmail.com' e Senha '123456'
    And que existe um dentista de Nome 'Carlos', Telefone '81971133619', CRO '12345', CPF '070.126.704-60', Especialidade 'Ortodondia'
    And que existe um dentista de Nome 'Arthur', Telefone '81971133619', CRO '12345', CPF '070.126.704-60', Especialidade 'Ortodondia'
    And existe uma consulta para o paciente de Nome 'José Daniel Florêncio Duarte Filho' e medico 'Carlos'
    When eu seleciono a consulta do paciente 'José Daniel Florêncio Duarte Filho'
    And clico no botao Editar
    And preencho o campo de Dentista com 'Arthur'
    And clico em Update Consultum
    Then eu vejo a mensagem 'Consultum was successfully updated.'

  Scenario: Apagar uma consulta
    Given estou logado com o administrador com o usuario 'admin@admin.com' e senha '987654321'
    And que existe um paciente de Nome 'José Daniel Florêncio Duarte Filho', Data de Nascimento '17/02/2001', CPF '013.862.694-41', Email 'danielduartefilho.df@gmail.com' e Senha '123456'
    And que existe um dentista de Nome 'Adalberto', Telefone '81971133619', CRO '12345', CPF '070.126.704-60', Especialidade 'Ortodondia'
    And existe uma consulta para o paciente de Nome 'José Daniel Florêncio Duarte Filho' e medico 'Adalberto'
    When eu seleciono a consulta do paciente 'José Daniel Florêncio Duarte Filho'
    And clico em Apagar
    Then eu vejo a mensagem 'Consultum was successfully destroyed.'