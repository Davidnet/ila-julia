### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ eacc2c1e-65ab-11eb-062a-11c3624dca07
begin
	using Images
	philip = load("philip.jpg")
end

# ╔═╡ 527d0e92-65ab-11eb-27e5-dd50ff93d73a
url = "https://i.imgur.com/VGPeJ6s.jpg"

# ╔═╡ ac9b760c-65ab-11eb-2255-c9e2b4e6563a
typeof(url)

# ╔═╡ 79a70a18-65ab-11eb-07ad-81652243a52f
download(url, "philip.jpg")

# ╔═╡ 2bb49126-65ac-11eb-0913-9d3e59446365


# ╔═╡ 7cba30b0-65ae-11eb-37ec-1154551ea2ef
typeof(philip)

# ╔═╡ 5d97ef28-65af-11eb-02f0-572e634c632e
philip[3000,2900]

# ╔═╡ bb7588bc-65af-11eb-27b5-4f1b5cb46e4f
typeof(philip[1,1])

# ╔═╡ b8e23424-65af-11eb-2a0c-ed19a45e83a8
RGB(1.0, 0.1, 0.1)

# ╔═╡ d598e0cc-65af-11eb-163f-2d157f620c90
x, y = size(philip)

# ╔═╡ ef399d82-65af-11eb-23d2-0d1da4f76f12
x*y

# ╔═╡ 45253440-65b0-11eb-06b9-d75914d1d75a
philip[1:1000, 1:400]

# ╔═╡ 6938b924-65b0-11eb-1986-33e9223dc9ff
begin
	(h, w) = size(philip)
	head = philip[(h ÷ 2):h, (w ÷ 10): (9w ÷ 10)]
end

# ╔═╡ db78d964-65b1-11eb-2e1f-7782c11c4bac
[head head]

# ╔═╡ fc174138-65b1-11eb-2b4f-299f5e9d8c87
[
	head                   reverse(head, dims=2)
	reverse(head, dims=1)  reverse(reverse(head, dims=1), dims=2)
]

# ╔═╡ 3504d2ee-65b2-11eb-1ec2-abea0b52908f
green = RGB(0.0, 1.0, 0.0)

# ╔═╡ 65171640-65b2-11eb-34b1-19c2cd5ff489
copy_phil = copy(head)

# ╔═╡ 4e0bae5c-65b2-11eb-34d6-fb8a374d4c6a
for i in 1:100
	for j in 1:300
		copy_phil[i, j] = green
	end
end

# ╔═╡ 7e5e8d36-65b2-11eb-0abb-d3bc64eaab49
copy_phil

# ╔═╡ Cell order:
# ╠═527d0e92-65ab-11eb-27e5-dd50ff93d73a
# ╠═ac9b760c-65ab-11eb-2255-c9e2b4e6563a
# ╠═79a70a18-65ab-11eb-07ad-81652243a52f
# ╠═2bb49126-65ac-11eb-0913-9d3e59446365
# ╠═eacc2c1e-65ab-11eb-062a-11c3624dca07
# ╠═7cba30b0-65ae-11eb-37ec-1154551ea2ef
# ╠═5d97ef28-65af-11eb-02f0-572e634c632e
# ╠═bb7588bc-65af-11eb-27b5-4f1b5cb46e4f
# ╠═b8e23424-65af-11eb-2a0c-ed19a45e83a8
# ╠═d598e0cc-65af-11eb-163f-2d157f620c90
# ╠═ef399d82-65af-11eb-23d2-0d1da4f76f12
# ╠═45253440-65b0-11eb-06b9-d75914d1d75a
# ╠═6938b924-65b0-11eb-1986-33e9223dc9ff
# ╠═db78d964-65b1-11eb-2e1f-7782c11c4bac
# ╠═fc174138-65b1-11eb-2b4f-299f5e9d8c87
# ╠═3504d2ee-65b2-11eb-1ec2-abea0b52908f
# ╠═65171640-65b2-11eb-34b1-19c2cd5ff489
# ╠═4e0bae5c-65b2-11eb-34d6-fb8a374d4c6a
# ╠═7e5e8d36-65b2-11eb-0abb-d3bc64eaab49
