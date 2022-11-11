[![Codacy Badge](https://app.codacy.com/project/badge/Grade/84718693f37d4e45af32fcd0ad92f051)](https://www.codacy.com/gh/OdontoLovers/OdontoES/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=OdontoLovers/OdontoES&amp;utm_campaign=Badge_Grade)
# Sistema de Gerenciamento de Consultório Odontológico
## :octocat: Integrantes
[José Daniel](https://github.com/JoseDanielF) | [Alex Silva](https://github.com/alexlsilva7) | [Vinicius Lucena](https://github.com/viniciuslucena) | [Arthur Costa](https://github.com/arthur007110) | [Antonio Bezerra](https://github.com/antoniobezerra01) | [Pedro Almeida](https://github.com/)
## :page_with_curl: Sobre o Projeto
Projeto para implementação de um SaaS em Ruby e Rails com foco no servidor para a disciplina de __Engenharia de Software__ ministrado pelo Professor Dr. [Rodrigo Andrade](https://github.com/rcaa), da UFAPE, referente ao período de 2022.1 com intuito de avaliação para a 2ª Verificação de Aprendizagem.
O projeto se dá por um sistema para um consultorio odontologico. Sistema esse que irá administrar os serviços oferecidos pelo consultório.
*   [Site no Heroku](https://shrouded-headland-94891.herokuapp.com/) :robot:

## :round_pushpin: Objetivos
O sistema possui 3 tipos de usuários e tem como objetivo gerenciar as consultas de um
consultório. Os tipos de usuários são: administrador, recepcionista e paciente. O
administrador pode cadastrar, editar, remover e visualizar recepcionistas, pacientes e a si
mesmo. Também pode cadastrar, editar e remover outros administradores, mas não os
visualizar (dica: o sistema precisa de um administrador padrão que seja persistente contra
remoções para evitar problemas). Um recepcionista pode editar e visualizar apenas a si
mesmo. Um visitante do sistema deve ser capaz de cadastrar-se como paciente e
consequentemente editar, remover e visualizar seu perfil. Um administrador deve ser capaz
de cadastrar uma entidade dentista que não é um perfil de usuário, essa entidade deve
possuir o horário de atendimento para cada dia que trabalha na clínica, bem como
informações sobre o dentista e suas especializações. Tudo isso deve ser visível para o
paciente na hora de marcar uma consulta. Um recepcionista deve ser capaz de alterar os
horários de um dentista se necessário enquanto que os pacientes devem ser capazes de
marcar a consulta em horários não ocupados por outros pacientes. Os recepcionistas devem
ser capazes de marcar e desmarcar uma consulta realizada por um paciente. Além disso,
pode confirmar a presença do paciente quando eles chegarem ao consultório (a consulta
deve ficar registrada no sistema, horário, nome do dentista, paciente, etc.)
## :hammer_and_wrench: Tecnologias Usadas
### [Ruby](https://www.ruby-lang.org/pt/)
*   Versão 3.1.1
### [Rails](https://rubyonrails.org/)
*   Versão 7.0.2.2
### [Codacy](https://www.codacy.com/product)
### [Heroku](https://www.heroku.com/)
## :construction: Status do Projeto
Finalizado
## :keyboard: Acessando o sistema
Para uso do sistema de maneira local, é necessário de antemão rodar o comando "rake db:seed" para que seja criado um usuário administrador padrão.
Você poderá fazer Login no sistema com email admin@admin.com e senha 987654321
