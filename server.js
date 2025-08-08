const conexao = mysql.createConnection(
    {
        host:'127.0.0.1',
        user: 'root',
        password:'1234',
        database:'EMPRESA FICTICIA',
        port: 3302
    }
)

conexao.connect(err => { 
    if(err){
        console.error('Erro ao conectar ao banco. ', err);
        return;
    }
    console.log('Conectado ao banco de dados!');
  });


// Função para ler dados de um arquivo JSON

const fs = require('fs');

    function lerDados(){
        const dadosBrutos = fs.readFileSync('package.json');
        const dados = JSON.parse(dadosBrutos);

        return dados;
    }
    //console.log(lerDados());
    