// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

let App = {
  connectToPad: id => {
    socket.connect()

    let channel = socket.channel(`pad:${id}`, {})
    let pad = document.getElementById('pad');

    pad.addEventListener('input', event => {
      console.log(pad.value);
      channel.push('change:editor', { content: pad.value });
    })

    channel.on('update:editor', message => {
      pad.value = message.content;
    })

    channel.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })
  }
};

if (window.padId != undefined) {
  App.connectToPad(window.padId);
}
