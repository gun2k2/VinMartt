const chatButton = document.querySelector('.chatbox__button');
const chatContent = document.querySelector('.chatbox__support');
const icons = {
    isClicked: '<img class="img-icon" src="${pageContext.request.contextPath}/assets/images/icons/chatbox-icon.svg" />',
    isNotClicked: '<img class="img-icon" src="${pageContext.request.contextPath}/assets/images/icons/chatbox-icon.svg" />'
}
const chatbox = new InteractiveChatbox(chatButton, chatContent, icons);
chatbox.display();
chatbox.toggleIcon(false, chatButton);