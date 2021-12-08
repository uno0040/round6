/*var perguntas = [['2+2','1',
                  '9*9','2',
                  '7*9','3',
                  '6/3','4',
                  'x^2*4x+9','5',
                  'x^2*4x+9','5',
                  '7x+77*x3x^2','6'
                  '(33+7x)x^2','7',
                  'x^2-(44*3)7 ,'8',
                  'x^3+44*5+x ,'9',
                  'x^3-77x*9 ,'10',
                  '3 + 4m – 9 = 6m – 4 + 12 ,'11',
                  '–5 + 3x + 4 = 11 + 9x ,'12',
                  '3(x + 2) = 15 ,'13',
                  '–5(k – 4 ) + 4 = 2(-2k – 2) ,'14',
                  '25x^2 = 20x – 4  ,'15',
                  '2x = 15 – x^2 ,'16',
                  '4 + x ( x - 4) = x ,'17',
                  'x ( x + 3) – 40 = 0 ,'18',
                  '7x^2 + x + 2 = 0 ,'19',
                  'x^2 - 18x + 45 = 0  ,'20',
                  '-x^2 - x + 30 = 0 ,'21',
                  'x^2 - 6x + 9 = 0  ,'22',
                  '(x + 3)^2 = 1 ,'23',
                  '(x - 5)^2 = 1 ,'24',
                  '(2x - 4)^2 = 0 ,'25',
                  '(x - 3)² = -2x^2 ,'26',
                  'x^2 + 3x - 28 = 0  ,'27',
                  '3x^2 - 4x + 2 = 0   ,'28',
                  'x^2 - 3 = 4x + 2  ,'29',
                  'x^3 + 4x2 – x – 4 = 0 ,'30',
                  '(x - 8)^2 = 7 ,'31',
                  '(x + 7)^2-7 = 7 ,'32',
                ]]
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
const TelhasDeVidro = document.querySelectorAll(".TelhasDeVidro");
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
let perderTelhasDeVidroaleatoriamente = [];
let perdervida = false;
let TelhasDeVidroanteriorlimpo = true;
let proximoTelhasDeVidro;
let iconejogador;
let i = 1;
let gameover = false;
let intervalo;

// CONFIGURANDO OS TelhasDeVidroS
const TelhasDeVidroMatriz = {
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
    "Os jogadores terão de cruzar duas pontes paralelas saltando sobre paineis de TelhasDeVidro, para que possam saber onde pular, calculos matematicos serão perguntados ao jogador e a resposta estará no TelhasDeVidro resistente onde o jogador proseguira para proxima fase, caso erre o jogador tem mais 3 vidas."
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
perderTelhasDeVidroaleatoriamente = ComputadorGerandoTelhasDeVidrosAleatorios(TelhasDeVidroMatriz);

//computador gerando números de blocos aleatórios para perder
function ComputadorGerandoTelhasDeVidrosAleatorios(TelhasDeVidroMatriz) {
  let Telhas = [];

  for (const set in TelhasDeVidroMatriz) {
    Telhas.push(getRandom(TelhasDeVidroMatriz[set][0], TelhasDeVidroMatriz[set][1]));
  }

  return Telhas;
}
// console.log(ComputadorGerandoTelhasDeVidrosAleatorios());

//quando o jogo começar
TelhasDeVidro.forEach((Telha) => {
  Telha.addEventListener("click", () => {
    //checando se o botao iniciajogo foi apertado
    if (!iniciajogo) {
      // retorna (Comentarios.innerHTML = "Por favor inicie o botão iniciar!");
      alert("Please press the start button!");
    }

    // verificar se o conjunto de TelhasDeVidros anterior foi apagado
    if (
      TelhasDeVidroMatriz[i][0] == Telha.dataset.value ||
      TelhasDeVidroMatriz[i][1] == Telha.dataset.value
    ) {
      // console.log("Limpo");

      TelhasDeVidroanteriorlimpo = true;

      //removendo o ícone do Jogador do TelhasDeVidro anterior
      if (i != 1) proximoTelhasDeVidro.removeChild(Jogador);
      // Verificando se é um TelhasDeVidro errado
      perderTelhasDeVidroaleatoriamente.forEach((lostTelha) => {
        if (Telha.dataset.value == lostTelha) {
          perdervida = true;

          // console.log("vidas - 1");
        }
      });
      return;
    }
    if (Telha.dataset.value) {
      alert("O TelhasDeVidro de trás não foi selecionado, por favor não roube!");
      TelhasDeVidroanteriorlimpo = false;
      return;
    }

    //
  });
});

TelhasDeVidro.forEach((Telha) => {
  Telha.addEventListener("click", () => {
    //verificando se o botão iniciajogo foi pressionado
    if (!iniciajogo) return;
    if (!TelhasDeVidroanteriorlimpo) return;
    if (perdervida) {
      Comentarios.innerText = "Você perdeu uma vida!";
      Telha.style.backgroundColor = "black";
      PosicaoInicial.appendChild(Jogador);
      i = 1;
      totaldevidas--;
      ContadorDeVidas.innerText = `Vidas restantes : ${totaldevidas}`;

      perdervida = false; //Resetando o perdervida
      Telha.dataset.value = null;

      //checando se o total de vidas é 0
      if (totaldevidas == 0) {
        // console.log("gameover");
        gameOver();
      }
      //
    } else {
      //se o jogador pisa no TelhasDeVidro certo, então i++
      i++;
      moveJogador(Telha);
      //   console.log("ir em frente");
      Comentarios.innerText = "Siga em frente!";
    }
    // console.log(Telha);
  });
});

// randomizar cada conjunto de TelhasDeVidros
function getRandom(min, max) {
  max++; //uma vez que o valor máximo não está incluído
  return Math.floor(Math.random() * (max - min)) + min;
}
// console.log(getAleatorio());

// Jogador se movendo para o próximo conjunto de TelhasDeVidro
function moveJogador(Telha) {
  Telha.appendChild(Jogador);
  proximoTelhasDeVidro = Telha;
}

//Para ganhar o jogo
PosicaoFinal.addEventListener("click", () => {
  if (i >= 8 && !gameover) {
    PosicaoFinal.removeChild(AsseguraPosicaoFinal);
    PosicaoFinal.appendChild(Jogador);
    winGame();
  }
});
//

//Para resetar o jogo
reIniciarBotao.addEventListener("click", () => {
  window.location = "./";
});

function gameOver() {
  CorpoDoJogo.classList.add("ocultar");
  TelaGameover.classList.remove("ocultar");
  clearintervalo(intervalo);
}

function winGame() {
  CorpoDoJogo.classList.add("ocultar");
  TextoGameover.innerText = "Você ganhou! Te pegarei na próxima vez ";
  TelaGameover.classList.remove("ocultar");
}