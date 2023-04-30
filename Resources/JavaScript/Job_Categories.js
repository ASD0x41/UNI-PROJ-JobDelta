const Job_type = document.querySelectorAll(".Job_type");

Job_type.forEach((Job_type) => {
    Job_type.addEventListener("click", () => {
        Job_type.classList.toggle("active");
    });

    Job_type.addEventListener("click", () => {

        if (!Job_type.classList.contains("active")) {

            Job_type.forEach(Job_type => {

                Job_type.classList.remove('active');

            })
        }

        Job_type.classList.toggle("active");

    });
});
