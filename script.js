var perguntas = [['exemplo','3']]
var resposta = '';
var jogoContinua; // <- boolean que define se o jogador morreu ou nao no jogo.  true -> vivo      false -> morto
/*do jeito que eu estou montando, vai ter um array com as perguntas e respostas, e uma funcao para cada "coisa"
se tiver uma ideia melhor de como fazer isso estou ouvindo, pois a maneira que estou fazendo me parece relativamente preguicosa*/
function round1() { 
    var pergunta = Math.floor(Math.random() * 11);
    if (resposta = perguntas[pergunta][1]) {
        jogoContinua = true
        checkVivo()
    }
    else {
        jogoContinua = false
        checkVivo()
    }
}
function checkVivo() { // <- funcao que vai checar se o jogador esta vivo ou nao e mudar o jogo de acordo com o estado do jogador  
    if (jogoContinua == true) {
        // nao sei oq botar aqui ainda
    }
    else if (jogoContinua == false) {
        fimDeJogo()
    }
}

function fimDeJogo(){ //<- funcao que vai declarar o fim de jogo ao jogador e chamar a funcao de reinicio de jogo

}

function reiniciaJogo(){ // <- funcao que vai reiniciar o jogo

}