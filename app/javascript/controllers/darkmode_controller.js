// ページが読み込まれるたびに動作させる
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
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
  }

  toggle(e){
    if (e.target.checked) {
      document.body.classList.add("dark-mode");
      localStorage.setItem("darkMode", "true");  // ダークモードの状態を保存
    } else {
      document.body.classList.remove("dark-mode");
      localStorage.setItem("darkMode", "false");  // ライトモードの状態を保存
    }
  }
}
