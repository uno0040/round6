/*var perguntas = [['2+2','1',  4
                  '9*9','2',  81
                  '7*9','3',  63
                  '6/3','4',  2
                  'x^2*4x+9','5',   4x^3+9
                  '3x^2-18x+24 = 0','6',  6
                  '(33+7x)x^2','7',   33x^2+7x^3
                  'x^2-(44*3)7 ,'8',  x^2-924
                  'Quantas soluções inteiras a inequação x² + x - 20 ≤ 0 admite? ,'9',    10
                  'A soma dos números inteiros x que satisfazem 2x + 1 ≤ x +3 ≤ 4x é '10',    3
                  'Sejam x e y números tais que os conjuntos {0, 7, 1} e {x, y, 1} são iguais. Então, podemos afirmar que: ,'11',   X+Y = 7
                  'x – y = 2 e x2 + y2 = 8, então x3 – y3 é igual a: ,'12',   20
                  'Se x + y = 13 e x · y = 1, então x2 + y2 é: ,'13',   167
                  'Se cos 2θ = 7/25 e θ pertence ao primeiro quadrante, então cos θ é igual a:,'14',  4/5
                  'João recebeu um aumento de 10% e com isso seu salário chegou a R$1.320,00. O salário de João antes do aumento era igual a? ,'15',  1200 reais
                  'Sendo A o ponto da reta 2x + y −1 = 0 que equidista dos pontos B = (1,1) e C = (0,−1) , e sendo D = (0,1) , a área do triângulo ACD vale,'16', 1/2
                  ','17',
                  ','18',
                  ','19',
                  ' ,'20',
                  ','21',
                  ','22',
                  ' ,'23',
                  ','24',
                  ','25',
                  ','26',
                  ','27',
                  ','28',
                  ','29',
                  ','30',
                  ' ,'31',
                  ' ,'32',
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
const InstrucaoBotao = document.getElementById("instrucao-botao");
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
const musicatema = document.getElementById("musicatema");

function togglePlay() {
  musicatema.volume = 0.1;
  return musicatema.paused ? musicatema.play() : musicatema.pause();
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