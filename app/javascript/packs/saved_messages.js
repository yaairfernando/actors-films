import $ from 'jquery';

class HasSavedMessage {
  constructor(elem) {
    this.elem = elem;
    this.setCallBack();
  }

  setCallBack = () => {
    console.log("set callback", this.elem)
    this.elem.querySelector("[data-behaivor='saved-message-select']").addEventListener("change", (e) => this.handleChange(e));
    // console.log(this.elem.find("[data-behaivor='saved-message-select']"));
    // this.elem.find("[data-behaivor='saved-message-select']").on("change", (e) => handleChange(e))
  }

  handleChange = (e) => {
    console.log("set change");
    console.log(e);
    let elem = $(this.elem);
    let saved_message_text = elem.find("[data-behaivor='saved-message-select']").find(":selected").data("body");
    console.log(saved_message_text);
    let comment_body = elem.find("[data-behaivor='comment-body']")
    comment_body.append(`${saved_message_text} \n`);
    // let selected = this.elem.querySelector("[data-behaivor='saved-message-select']").options[e.selectedIndex]
    // console.log(selected);

  }
}

$(() => {
  new HasSavedMessage(document.querySelector("[data-behaivor='has-saved-messages']"));
  // console.log(document.querySelector("[data-behaivor='has-saved-messages']"))
  // document.querySelector("[data-behaivor='has-saved-messages']").map((elem) => {
  //   console.log(elem);
  // })
  // $.map($("[data-behaivor='has-saved-messages']"), (elem) => {
  //   //console.log(elem);
  //   new HasSavedMessage(elem);
  // })
})