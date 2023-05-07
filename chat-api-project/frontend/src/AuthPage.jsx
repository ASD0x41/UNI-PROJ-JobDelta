import axios from "axios";

const AuthPage = (props) => {
  const onSubmit = (e) => {

        const urlParams = new URLSearchParams(window.location.search);
        const username = urlParams.get("uname");
        document.getElementsByName("username")[0].value = username;

    e.preventDefault();
    const { value } = e.target[0];
    axios
      .post("http://localhost:3001/authenticate", { username: value })
      .then((r) => props.onAuth({ ...r.data, secret: value }))
      .catch((e) => console.log("Auth Error", e));
  };

  return (
    <div className="background">

          <script type="text/javascript">
              setTimeout(function() {"{"}document.getElementById("chatform").submit();{"}"}, 100);
          </script>

      <form id="chatform" onSubmit={onSubmit} className="form-card">
        <div className="form-title">Welcome 👋</div>

        <div className="form-subtitle">Set a username to get started</div>

        <div className="auth">
          <div className="auth-label">Username</div>
          <input className="auth-input" name="username" />
          <button id="subchat" className="auth-button" type="submit">
            Enter
          </button>
        </div>
      </form>
    </div>
  );
};

export default AuthPage;