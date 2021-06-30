const displayPlant = () => {
  const plants = document.querySelectorAll(".plant-garden");
  const plantName = document.getElementById("plant-name");
  const plantImage = document.getElementById("plant-image");
  const plantWatering = document.getElementById("plant-watering");
  const plantSunshine = document.getElementById("plant-sunshine");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");
  
  plants.forEach(plant => {
    plant.addEventListener("click", (event) => {
      if (event.currentTarget === plant) {
        event.stopPropagation();
        generalAdvise.style.display = "none";
        specificAdvise.style.display = "block";
        console.log("specific");
        plants.forEach(plant => {
          plant.classList.remove("plant-selection");
        });

        event.currentTarget.classList.add("plant-selection");

        plantName.innerHTML = event.currentTarget.dataset.name;
        plantImage.src=`${event.currentTarget.dataset.image}`;

        // Watering
        const iconsWatering = new Array(parseInt(event.currentTarget.dataset.watering, 10)).fill("");
        const iconsW = [];
        iconsWatering.forEach((iconWatering) => {
          iconsW.push("<i class='fas fa-tint'></i>");
        });
        const watering = iconsW;
        console.log(watering);
        const iWatering = "".concat(...watering);
        console.log(iWatering);

        plantWatering.innerHTML = `Arrosage <br> ${iWatering}`;

        // Sunshine
        const iconsSunshine = new Array(parseInt(event.currentTarget.dataset.sunshine, 10)).fill("");
        const iconsS = [];
        iconsSunshine.forEach((iconSunshine) => {
          iconsS.push("<i class='fas fa-sun'></i>");
        });
        const sunshine = iconsS;
        const iSunshine = "".concat(...sunshine);

        plantSunshine.innerHTML = `Exposition <br> ${iSunshine}`;
      }
    });
  });
};

const displayBack = () => {
  const back = document.querySelector(".garden")
  const plants = document.querySelectorAll(".plant-garden");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");

  back.addEventListener("click", (event) => {
    if (event.currentTarget === back) {
      event.stopPropagation();
      generalAdvise.style.display = "block";
      specificAdvise.style.display = "none";
      event.currentTarget.classList.remove("plant-selection");
      console.log(event);
      console.log("general");
      plants.forEach(plant => {
        plant.classList.remove("plant-selection");
      });
    }
  });
};

const collapseKit = () => {
  const buttons = document.querySelectorAll(".btn")

  buttons.forEach(button => {
    button.addEventListener("click", (event) => {
      $('.collapse').collapse()
    });
  });
};

export {displayPlant, displayBack, collapseKit}
