const scroll = () => {
  const questions = document.querySelectorAll(".clickable");
  questions.forEach((question) => {
    question.addEventListener('click', (event) => {
      const parent =  event.currentTarget.parentElement;
      console.log(parent);
      let number = parseInt(parent.dataset.number[parent.dataset.number.length -1], 10);
      console.log(number);
      location.href = `#question-${number+1}`;
      // questions.parentElement.parentElement.parentElement.parentElement
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
