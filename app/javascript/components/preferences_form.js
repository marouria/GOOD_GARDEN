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

const pointImages = () => {
  const images = document.querySelectorAll(".clickable");
  images.forEach((image) => {
    image.addEventListener('mouseover', (event) => {
      event.currentTarget.classList.add('pointer');
    });
  });
};

export {pointImages}
