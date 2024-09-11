
document.addEventListener("DOMContentLoaded", function() {
    const darkModeCheck = document.getElementById("dark_modecheck");
  
    // 初期状態を設定
    if (darkModeCheck.checked) {
      document.body.classList.add("dark-mode");
    } else {
      document.body.classList.remove("dark-mode");
    }
  
    // チェックボックスが変わったらテーマを切り替える
    darkModeCheck.addEventListener("change", function() {
      if (darkModeCheck.checked) {
        document.body.classList.add("dark-mode");
      } else {
        document.body.classList.remove("dark-mode");
      }
    });
  });
  