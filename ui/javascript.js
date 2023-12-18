function updateButtons(options) {
  var button1 = document.getElementById("buttontext1");
  var button2 = document.getElementById("buttontext2");
  var button3 = document.getElementById("buttontext3");
  var button4 = document.getElementById("buttontext4");

  if (!options || options.length === 0) {
    hideButtons();
    return;
  }

  for (var i = 0; i < options.length; i++) {
    var button = getButtonElement(i + 1);
    if (button) {
      button.innerHTML = `<div class="buttonsayi" id="button${i + 1}">${i + 1}</div>${options[i].label}`;
      button.style.display = 'block';
      button.onclick = (function (option) {
        return function () { 
          $.post(`https://${GetParentResourceName()}/npc-menu:islem`, JSON.stringify({
            event: option.event,
            args: option.args,
            type: option.type
          }));
          var accept = new Audio('accept.mp3');
          accept.volume = 0.4;
          accept.play();
          // Ekranı gizle
          var body = $('body'); 
          body.fadeOut(700, function() {
          $.post(`https://${GetParentResourceName()}/npc-menu:hideMenu`);
          });
        };
      })(options[i]); 
    }
  }
  hideExtraButtons(options.length);
  adjustBackgroundHeight(options.length);
}

function hideButtons() {
  for (var i = 1; i <= 4; i++) {
    var button = getButtonElement(i);
    if (button) {
      button.style.display = 'none';
    }
  }
}

function hideExtraButtons(visibleButtonCount) {
  for (var j = visibleButtonCount + 1; j <= 4; j++) {
    var extraButton = getButtonElement(j);
    if (extraButton) {
      extraButton.style.display = 'none';
    }
  }
}

function adjustBackgroundHeight(visibleButtonCount) {
  var background = document.getElementById("background");
  if (visibleButtonCount > 2) {
    background.style.height = "243px";
  } else {
    background.style.height = "180px";
  }
}

function getButtonElement(index) {
  return document.getElementById("buttontext" + index);
}


window.addEventListener('message', function(event) {
  if (event.data.type === 'dialog') {
      updateButtons(event.data.options);
      ////////////////////
      yazilcak = event.data.name
      var isim = document.getElementById("npcismiaq");
      isim.innerHTML = `<b>${yazilcak.split(' ')[0]}</b> ${yazilcak.split(' ')[1]}`;
      /////////////////////////
      var yazi = document.getElementById("npcbiseydiyo");
      yazi.innerHTML = `<div class="ucgensey"></div>${event.data.text}`;      
      /////////////////////////
      var meslek = document.getElementById("npcmeslekamk")
      meslek.innerText = event.data.job
      /////////////////////////
      document.body.style.display = 'block';
      var popup = new Audio('popup.mp3');
	    popup.volume = 0.4;
	    popup.play();
  } else if (event.data.type === 'hide') {
      document.body.style.display = 'none';
  }
});

document.addEventListener('keydown', function(event) {
  var keyPressed = event.key;
  switch (keyPressed) {
    case '1':
      clickButton(1);
      break;
    case '2':
      clickButton(2);
      break;
    case '3':
      clickButton(3);
      break;
    case '4':
      clickButton(4);
      break;
    case 'Escape':
      var body = $('body');
      body.fadeOut(700, function() {
        var popupreverse = new Audio('popupreverse.mp3');
			  popupreverse.volume = 0.4;
			  popupreverse.play();
        $.post(`https://${GetParentResourceName()}/npc-menu:hideMenu`);
      });
      break;
  }
});

function clickButton(buttonIndex) {
  var accept = new Audio('accept.mp3');
	accept.volume = 0.4;
	accept.play();
  var button = getButtonElement(buttonIndex);
  if (button && button.style.display !== 'none') {
    button.click();
  }
}


