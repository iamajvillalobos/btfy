import { Controller } from "stimulus";

export default class extends Controller {
	initialize() {
		this.user = JSON.parse(this.data.get("user"))
	}

	connect() {
		Paddle.Setup({ vendor: 118869 });
	}

	subscribe(event) {
		const product = event.currentTarget.dataset.product;
		Paddle.Checkout.open({
			product: product,
			email: this.user,
		})
	}
}