import { Controller } from "stimulus";

export default class extends Controller {
	static targets = ["user"]

	initialize() {
		this.user;
	}

	connect() {
		Paddle.Setup({ vendor: 118869 });

		this.userTarget.style.display = "none";
		this.user = JSON.parse(this.userTarget.textContent)
	}

	subscribe() {
		Paddle.Checkout.open({
			product: 610658,
			email: this.user.email,
		})
	}
}