const faqs = document.querySelectorAll(".faq");

faqs.forEach((faq) => {
    faq.addEventListener("click", () => {
        faq.classList.toggle("active");
    });

    faq.addEventListener("click", () => {

        if (!faq.classList.contains("active")) {

            faqs.forEach(faq => {

                faq.classList.remove('active');

            })
        }

        faq.classList.toggle("active");

    });
});

