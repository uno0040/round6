/*var perguntas = [['2+2','1',
                  '9*9','2',
                  '7*9','3',
                  '6/3','4',
                  'x^2*4x+9','5',]]
var resposta = '';
var jogoContinua; // <- boolean que define se o jogador morreu ou nao no jogo.  true -> vivo      false -> morto
/*do jeito que eu estou montando, vai ter um array com as perguntas e respostas, e uma funcao para cada "coisa"
se tiver uma ideia melhor de como fazer isso estou ouvindo, pois a maneira que estou fazendo me parece relativamente preguicosa
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

}*/
const InstrucaoBotao = document.getElementById("Instrucao-Botao");
const IniciarBotao = document.getElementById("Iniciar-Botao");
const Temporizador = document.getElementById("Temporizador");
const Comentarios = document.getElementById("Comentarios");
const ContadorDeVidas = document.querySelector(".Contador-De-Vidas");
const Jogador = document.querySelector(".Icone-Jogador");
const CorpoDoJogo = document.querySelector(".Corpo-Do-Jogo");
const Vidro = document.querySelectorAll(".Vidro");
const PosicaoInicial = document.querySelector(".Posicao-Inicial-Jogador");
const PosicaoFinal = document.querySelector(".Posicao-Final-Jogador");
const AsseguraPosicaoFinal = document.querySelector(".Posicao-Final");
const TelaGameover = document.querySelector(".Tela-Gameover");
const TextoGameover = document.querySelector(".Texto-Gameover");
const reIniciarBotao = document.getElementById("reIniciar-Botao");

// Toggle audio
const MeuAudio = document.getElementById("MeuAudio");

function togglePlay() {
  MeuAudio.volume = 0.2;
  return MeuAudio.paused ? MeuAudio.play() : MeuAudio.pause();
}

let Tempo = 30;
let iniciajogo = false;
let totaldevidas = 3;
let perdervidroaleatoriamente = [];
let perdervida = false;
let vidroanteriorlimpo = true;
let proximovidro;
let iconejogador;
let i = 1;
let gameover = false;
let intervalo;

// CONFIGURANDO OS VIDROS
const VidroMatriz = {
  1: [1, 2],
  2: [3, 4],
  3: [5, 6],
  4: [7, 8],
  5: [9, 10],
  6: [11, 12],
  7: [13, 14],
};

// instrução para notificação do botão
function instructions() {
  alert(
    "Os jogadores terão de cruzar duas pontes paralelas saltando sobre paineis de vidro, para que possam saber onde pular, calculos matematicos serão perguntados ao jogador e a resposta estará no vidro resistente onde o jogador proseguira para proxima fase, caso erre o jogador tem mais 3 vidas."
  );
}
InstrucaoBotao.addEventListener("click", instructions);

//Controle de botão iniciar 
IniciarBotao.addEventListener("click", () => {
  iniciajogo = true;
  intervalo = setintervalo(() => {
    if (Tempo > 0) {
      Tempo--;
      Temporizador.innerText = `Tempo : ${Tempo}sec`;
      if (Tempo == 0) {
        gameOver();
      }
    }
  }, 1000);
});

//gerando peças perdidas aleatórias para o jogo
perdervidroaleatoriamente = ComputadorGerandoVidrosAleatorios(VidroMatriz);

//computador gerando números de blocos aleatórios para perder
function ComputadorGerandoVidrosAleatorios(VidroMatriz) {
  let Tiles = [];

  for (const set in VidroMatriz) {
    Tiles.push(getRandom(VidroMatriz[set][0], VidroMatriz[set][1]));
  }

  return Tiles;
}
// console.log(ComputadorGerandoVidrosAleatorios());

//quando o jogo começar
Vidro.forEach((tile) => {
  tile.addEventListener("click", () => {
    //checando se o botao iniciajogo foi apertado
    if (!iniciajogo) {
      // retorna (Comentarios.innerHTML = "Por favor inicie o botão iniciar!");
      alert("Please press the start button!");
    }

    // checking if the previous tile set was cleared
    if (
      VidroMatriz[i][0] == tile.dataset.value ||
      VidroMatriz[i][1] == tile.dataset.value
    ) {
      // console.log("cleared");

      vidroanteriorlimpo = true;

      //removing the Jogador icon from the previous tile
      if (i != 1) proximovidro.removeChild(Jogador);
      // checking if it is a losing tile
      perdervidroaleatoriamente.forEach((lostTile) => {
        if (tile.dataset.value == lostTile) {
          perdervida = true;

          // console.log("lives - 1");
        }
      });
      return;
    }
    if (tile.dataset.value) {
      alert("Previous set has not been selected! Do not cheat!");
      vidroanteriorlimpo = false;
      return;
    }

    //
  });
});

Vidro.forEach((tile) => {
  tile.addEventListener("click", () => {
    //checking if iniciajogo button was pressed
    if (!iniciajogo) return;
    if (!vidroanteriorlimpo) return;
    if (perdervida) {
      Comentarios.innerText = "You lost a life!";
      tile.style.backgroundColor = "black";
      PosicaoInicial.appendChild(Jogador);
      i = 1;
      totaldevidas--;
      ContadorDeVidas.innerText = `Lives left : ${totaldevidas}`;

      perdervida = false; //resetting the perdervida
      tile.dataset.value = null;

      //checking if total life is 0
      if (totaldevidas == 0) {
        // console.log("gameover");
        gameOver();
      }
      //
    } else {
      //if the Jogador steps onto the correct tile then i++
      i++;
      moveJogador(tile);
      //   console.log("move on");
      Comentarios.innerText = "Move forward!";
    }
    // console.log(tile);
  });
});

// randomizing each tile set
function getRandom(min, max) {
  max++; //since the max value is not included
  return Math.floor(Math.random() * (max - min)) + min;
}
// console.log(getRandom());

// Jogador moving to the next tile set
function moveJogador(tile) {
  tile.appendChild(Jogador);
  proximovidro = tile;
}

//To win the game
PosicaoFinal.addEventListener("click", () => {
  if (i >= 8 && !gameover) {
    PosicaoFinal.removeChild(AsseguraPosicaoFinal);
    PosicaoFinal.appendChild(Jogador);
    winGame();
  }
});
//

//to restart the game
reIniciarBotao.addEventListener("click", () => {
  window.location = "./";
});

function gameOver() {
  CorpoDoJogo.classList.add("hide");
  TelaGameover.classList.remove("hide");
  clearintervalo(intervalo);
}

function winGame() {
  CorpoDoJogo.classList.add("hide");
  TextoGameover.innerText = "You Won! I'll get you next Tempo ";
  TelaGameover.classList.remove("hide");
}