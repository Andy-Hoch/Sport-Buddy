import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = {
    chatroomId: Number,
    currentUserId: Number
  }
  static targets = ["messages", "message"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => {
          this.#insertMessageAndScrollDown(data)
        const message = this.messageTargets[this.messageTargets.length - 1]
        const senderId = Number(message.dataset.messageSenderId);
        if(senderId !== this.currentUserIdValue) this.#updateMessageClassesOnReceiver(message)
      } }
    )
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #updateMessageClassesOnReceiver(messageElement){
    messageElement.classList.remove('user-message')
    messageElement.classList.add('other-message')
  }
}
