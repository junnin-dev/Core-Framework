const { ref } = Vue

// Customize language for dialog menus and carousels here

const load = Vue.createApp({
  setup () {
    return {
      CarouselText1: 'Você pode adicionar/remover itens, veículos, empregos e gangues através da pasta compartilhada.',
      CarouselSubText1: 'Foto capturada por: Markyoo#8068',
      CarouselText2: 'Adicionar dados adicionais do jogador pode ser alcançado modificando o arquivo Core Player.lua.',
      CarouselSubText2: 'Foto capturada por: ihyajb#9723',
      CarouselText3: 'Todos os ajustes específicos do servidor podem ser feitos nos arquivos config.lua durante toda a compilação.',
      CarouselSubText3: 'Foto capturada por: FLAPZ[INACTIV]#9925',
      CarouselText4: 'Para suporte adicional, junte -se à nossa comunidade em https://discord.gg/dwRtwRNfSz',
      CarouselSubText4: 'Foto capturada por: Robinerino#1312',

      DownloadTitle: 'Baixando o servidor Core',
      DownloadDesc: "Segure apertado enquanto começamos a baixar todos os recursos/ativos necessários para reproduzir no Core Server.\ n \ Nafter Download foi concluído com sucesso, você será colocado no servidor e essa tela desaparecerá.Por favor, não saia ou desligue seu PC. ",

      SettingsTitle: 'Settings',
      AudioTrackDesc1: 'Quando desativado, a reprodução atual de áudio será interrompida.',
      AutoPlayDesc2: 'Quando as imagens de carrossel desabilitadas pararão de andar de bicicleta e permanecem no último mostrado.',
      PlayVideoDesc3: 'Quando o vídeo desativado para de tocar e permanecer pausado.',

      KeybindTitle: 'Default Keybinds',
      Keybind1: 'Abrir Inventory',
      Keybind2: 'Cycle Proximity',
      Keybind3: 'Abrir Phone',
      Keybind4: 'Toggle Seat Belt',
      Keybind5: 'Abrir Target Menu',
      Keybind6: 'Radial Menu',
      Keybind7: 'Abrir Hud Menu',
      Keybind8: 'Talk Over Radio',
      Keybind9: 'Open Scoreboard',
      Keybind10: 'Vehicle Locks',
      Keybind11: 'Toggle Engine',
      Keybind12: 'Pointer Emote',
      Keybind13: 'Keybind Slots',
      Keybind14: 'Hands Up Emote',
      Keybind15: 'Use Item Slots',
      Keybind16: 'Cruise Control',

      firstap: ref(true),
      secondap: ref(true),
      thirdap: ref(true),
      firstslide: ref(1),
      secondslide: ref('1'),
      thirdslide: ref('5'),
      audioplay: ref(true),
      playvideo: ref(true),
      download: ref(true),
      settings: ref(false),
    }
  }
})

load.use(Quasar, { config: {} })
load.mount('#loading-main')

var audio = document.getElementById("audio");
audio.volume = 0.05;

function audiotoggle() {
    var audio = document.getElementById("audio");
    if (audio.paused) {
        audio.play();
    } else {
        audio.pause();
    }
}

function videotoggle() {
    var video = document.getElementById("video");
    if (video.paused) {
        video.play();
    } else {
        video.pause();
    }
}

let count = 0;
let thisCount = 0;

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },

    initFunctionInvoking(data) {
        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (data.idx / count) * 100 + "%";
    },

    startDataFileEntries(data) {
        count = data.count;
    },

    performMapLoadFunction(data) {
        ++thisCount;

        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (thisCount / count) * 100 + "%";
    },
};

window.addEventListener("message", function (e) {
    (handlers[e.data.eventName] || function () {})(e.data);
});
