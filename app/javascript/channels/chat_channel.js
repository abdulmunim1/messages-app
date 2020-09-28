import consumer from "./consumer";

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const elem = document.getElementById("user-id");
    const user_id = Number(elem.getAttribute("data-user-id"));
    let html;
    if (user_id === data.message.user_id) {
      html = data.mine;
    } else {
      html = data.theirs;
    }
    const messagesContainer = document.getElementById("messages");
    messagesContainer.innerHTML = messagesContainer.innerHTML + html;
    const TextContainer = document.getElementById("send-message-text");
    TextContainer.value = "";
    messagesContainer.scrollTo(0, messagesContainer.scrollHeight);
  },

  speak: function () {
    return this.perform("speak");
  },
});
