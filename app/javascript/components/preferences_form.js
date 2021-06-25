const scroll = () => {
  const questions = document.querySelectorAll(".question");
  questions.forEach((question) => {
    question.addEventListener('click', (event) => {
      let number = parseInt(event.currentTarget.id[event.currentTarget.id.length -1], 10);
      location.href = `#question-${number+1}`;
    });
  });
};

export {scroll}

const selectImage = () => {
  const icones = document.querySelectorAll(".clickable");
  console.log(icones);
};
