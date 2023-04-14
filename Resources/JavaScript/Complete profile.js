function previewProfileImage(event) {
    const profileImage = document.getElementById("profile-image");
    const selectedFile = event.target.files[0];

    if (selectedFile) {
        const reader = new FileReader();
        reader.onload = function () {
            profileImage.src = reader.result;
        };
        reader.readAsDataURL(selectedFile);
    }
}
