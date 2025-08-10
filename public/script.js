const urlParams = new URLSearchParams(window.location.search);
        const mensagem = urlParams.get('mensagem');
        if (mensagem === 'sucesso') {
            alert('Inserido com sucesso!');
        }

        function Edit1_1() {
            const newSub = document.createElement('input type="text" placeholder= "nome do subprocesso"')
            newSub.innerHTML;
            li.appendChild(newSub);
        }

        function ClickPerfil(){
            if (perfil.style.display == 'block') 
            {
                perfil.style.display = 'none'
            } else{
                perfil.style.display = 'block'
            }
        }