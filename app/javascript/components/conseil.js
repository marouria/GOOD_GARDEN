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
       
        generalAdvise.style.display = "none";
        specificAdvise.style.display = "block";
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
        const iWatering = "".concat(...watering);

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
  const back = document.getElementById("backBtn");
  const plants = document.querySelectorAll(".plant-garden");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");

  back.addEventListener("click", (event) => {
    if (event.currentTarget === back) {
      // event.stopPropagation();
      console.log("he");
      console.log(event.currentTarget);
      generalAdvise.style.display = "block";
      specificAdvise.style.display = "none";
      event.currentTarget.classList.remove("plant-selection");
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
      $(event.currentTarget).collapse('toggle');
      // document.getElementById()
    });
  });
};

export {displayPlant, displayBack, collapseKit}
