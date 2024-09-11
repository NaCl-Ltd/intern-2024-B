// ページが読み込まれるたびに動作させる
document.addEventListener("turbo:load", function() {
    const darkModeCheck = document.getElementById("dark_modecheck");
  
    if (!darkModeCheck) return; // ボタンが存在しない場合、処理を停止
  
    // ページ読み込み時にlocalStorageから状態を取得して適用
    const isDarkMode = localStorage.getItem("darkMode") === "true";
    if (isDarkMode) {
      document.body.classList.add("dark-mode");
      darkModeCheck.checked = true;
    } else {
      document.body.classList.remove("dark-mode");
      darkModeCheck.checked = false;
    }
  
    // チェックボックスが変わったらテーマを切り替えて状態をlocalStorageに保存
    darkModeCheck.addEventListener("change", function() {
      if (darkModeCheck.checked) {
        document.body.classList.add("dark-mode");
        localStorage.setItem("darkMode", "true");  // ダークモードの状態を保存
      } else {
        document.body.classList.remove("dark-mode");
        localStorage.setItem("darkMode", "false"); // ライトモードの状態を保存
      }
    });
  });
  