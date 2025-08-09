const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();
const port = 3000;
app.use(express.static(path.join(__dirname, 'public')));

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '1234',
    database: 'IMPRESA_FICTICIA',
    port: 3302
});

//CONECTAR AO BANCO DE DADOS
connection.connect( err => {
    if(err){
        console.error('Erro ao conectar ao banco. ', err);
        return;
    }
    console.log('Conectado ao banco!');
});


app.use(express.urlencoded( {extended: true} ));

app.get('/', (req, res)=>{
    res.sendFile(path.join(__dirname, 'public/Empresa Ficticia.html'));
});


app.post('/inserirArea', (req, res)=>{
    
    const { nome } = req.body;
    const sql = 'CALL addArea(?)';

    connection.query(sql, [nome], (err, results)=>{
      if(err){
        console.error('Erro ao inserir Area:', err);
        res.send('Erro ao inserir Area.');
        return;
      }  
      res.redirect('/?mensagem=sucesso');
    });

});


app.post('/inserirProcesso', (req, res)=>{
    
    const { nome } = req.body;
    const sql = 'CALL addProcesso(?)';

    connection.query(sql, [nome], (err, results)=>{
      if(err){
        console.error('Erro ao inserir Processo:', err);
        res.send('Erro ao inserir Processo.');
        return;
      }  
      res.redirect('/?mensagem=sucesso');
    });

});


app.post('/inserirSubprocesso', (req, res)=>{
    
    const { nome, status } = req.body;
    const sql = 'CALL addSubprocesso(?, ?)';

    connection.query(sql, [nome, status], (err, results)=>{
      if(err){
        console.error('Erro ao inserir Subprocesso:', err);
        res.send('Erro ao inserir Subprocesso.');
        return;
      }  
      res.redirect('/?mensagem=sucesso');
    });

});


app.post('/inserirSub-Subprocesso', (req, res)=>{
    
    const { nome, status } = req.body;
    const sql = 'CALL addSub_Sub(?, ?)';

    connection.query(sql, [nome, status], (err, results)=>{
      if(err){
        console.error('Erro ao inserir Sub-Subrocesso:', err);
        res.send('Erro ao inserir Sub-Subrocesso.');
        return;
      }  
      res.redirect('/?mensagem=sucesso');
    });

});


app.post('/consultarArea', (req, res)=>{
    const { nome } = req.body;
    const sql = 'CALL consultArea(?)';

    connection.query(sql, [nome], (err, results)=>{
    if(err){
        console.error('Erro ao consultar Area: ', err);
        res.send('Erro ao consultar Area.');
        return;
    }
    const area = results[0];

    res.send(`
        <script>
            localStorage.setItem('Area', '${JSON.stringify(area)}');
            localStorage.setItem('consultaRealizada', 'true'); 
            window.location.href = 'public/Empresa Ficticia.html';
        </script>
        `);
    });
});


app.post('/consultarProcesso', (req, res)=>{
    const { nome } = req.body;
    const sql = 'CALL consultProcesso(?)';

    connection.query(sql, [nome], (err, results)=>{
    if(err){
        console.error('Erro ao consultar Processo: ', err);
        res.send('Erro ao consultar Processo.');
        return;
    }
    const processo = results[0];

    res.send(`
        <script>
            localStorage.setItem('Processo', '${JSON.stringify(processo)}');
            localStorage.setItem('consultaRealizada', 'true'); 
            window.location.href = 'public/Empresa Ficticia.html';
        </script>
        `);
    });
});


app.post('/consultarSubprocesso', (req, res)=>{
    const { nome } = req.body;
    const sql = 'CALL consultSubProcesso(?)';

    connection.query(sql, [nome], (err, results)=>{
    if(err){
        console.error('Erro ao consultar Subprocesso: ', err);
        res.send('Erro ao consultar Subprocesso.');
        return;
    }
    const subprocesso = results[0];

    res.send(`
        <script>
            localStorage.setItem('Subprocesso', '${JSON.stringify(subprocesso)}');
            localStorage.setItem('consultaRealizada', 'true'); 
            window.location.href = 'public/Empresa Ficticia.html';
        </script>
        `);
    });
});


app.post('/consultarSub-Subprocesso', (req, res)=>{
    const { nome } = req.body;
    const sql = 'CALL consultSubSub(?)';

    connection.query(sql, [nome], (err, results)=>{
    if(err){
        console.error('Erro ao consultar Sub-Subprocesso: ', err);
        res.send('Erro ao consultar Sub-Subprocesso.');
        return;
    }
    const subsub = results[0];

    res.send(`
        <script>
            localStorage.setItem('Sub-Subprocesso', '${JSON.stringify(subsub)}');
            localStorage.setItem('consultaRealizada', 'true'); 
            window.location.href = 'public/Empresa Ficticia.html';
        </script>
        `);
    });
});



// INICIAR O SERVIDOR
app.listen(port, ()=>{
    console.log(`Servidor rodando em http://localhost:${port}`);
});