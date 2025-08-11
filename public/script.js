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

        function editar(){
            b1.style.display ='block';
            b2.style.display ='block';
            b3.style.display ='block';
            b4.style.display ='block';

            edit.style.color ='white';
            edit.style.backgroundColor ='#225a58';

            visu.style.color='black';
            visu.style.backgroundColor='white';

            sa.style.display ='block';
            add.style.display ='block';
            v1.style.height ='65.5vh';
            v2.style.height ='65vh';
        }

        function visualizar(){
            b1.style.display ='none';
            b2.style.display ='none';
            b3.style.display ='none';
            b4.style.display ='none';

            edit.style.color ='black';
            edit.style.backgroundColor ='white';

            visu.style.color='white';
            visu.style.backgroundColor='#225a58';

            sa.style.display ='none';
            add.style.display ='none';
            v1.style.height ='63vh';
            v2.style.height ='63vh';
        }