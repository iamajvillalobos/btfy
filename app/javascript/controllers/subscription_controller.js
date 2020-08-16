import { Controller } from "stimulus";

export default class extends Controller {
	initialize() {
		this.user = JSON.parse(this.data.get("user"));
	}

	connect() {
		Paddle.Setup({ vendor: 118869 });
	}

	subscribe(event) {
		const product = event.currentTarget.dataset.product;
		Paddle.Checkout.open({
			product: product,
			email: this.user.email,
			passthrough: JSON.stringify({
				owner_id: this.user.id,
				owner_type: "User",
			}),
			successCallback: this.checkoutComplete.bind(this),
		});
	}

	checkoutComplete(data) {
		let isCompleted = data.checkout.completed;

		if (isCompleted) {
			location.href = this.data.get("billing-path");
		}
	}
}
