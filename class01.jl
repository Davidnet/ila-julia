### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ ff784890-6596-11eb-1267-9d22e395e0b5
begin
	using Images
	philip = load("philip.jpg")
end

# ╔═╡ 1a4aabc8-659d-11eb-147f-d70f4bab0dd8
begin
	using Statistics
	using FFTW
	using Plots
	using DSP
	using ImageFiltering
	using PlutoUI
end

# ╔═╡ 99b84d9a-6596-11eb-3780-493842c9a741
url = "https://i.imgur.com/VGPeJ6s.jpg" 

# ╔═╡ f146123e-6596-11eb-053f-d7ca76637cca
download(url, "philip.jpg")

# ╔═╡ 2cacddf2-6597-11eb-30d7-7b09b1695f87
begin
	import Pkg
	Pkg.add("Images")
	Pkg.add("ImageMagick")
	Pkg.add("FFTW")
	Pkg.add("Plots")
	Pkg.add("DSP")
	Pkg.add("ImageFiltering")
	Pkg.add("PlutoUI")
end

# ╔═╡ 54c2894c-6598-11eb-180b-93b112c4e74f
typeof(philip)

# ╔═╡ 6a60375e-6598-11eb-05cb-91afafa6e6b5
RGB(1.0,0.1,0.1)

# ╔═╡ 79134106-6598-11eb-2a5a-c56b1d571be7
size(philip)

# ╔═╡ 81645246-6598-11eb-0611-17bde8634f7d
typeof(philip[100, 400])

# ╔═╡ 8e1b7d48-6598-11eb-2795-fdc2b39d567d
philip[1:1000, 1:400]

# ╔═╡ b613dfca-6598-11eb-21b8-1f93b0ded964
begin
	(h, w) = size(philip)
	head = philip[(h ÷ 2):h, (w ÷ 10): (9w ÷ 10)]
end

# ╔═╡ e4bc8520-6598-11eb-14fa-f367f607b244
[head head]

# ╔═╡ ec194966-6598-11eb-29ac-db0ffaef9645
[
	head     reverse(head, dims=2)
	reverse(head, dims=1) reverse(reverse(head, dims=1), dims=2)
	
]

# ╔═╡ 167290dc-6599-11eb-28dd-d365002a76f7
new_phil = copy(head)

# ╔═╡ 3648e29e-6599-11eb-3f49-9376d6df65d7
red = RGB(1.0,0.0,0.0)

# ╔═╡ 270e0f16-6599-11eb-2f6b-1ba4ddde780f
for i in 1:100
	for j in 1:300
		new_phil[i, j] = red
	end
end

# ╔═╡ 5e73d080-6599-11eb-1840-4788cf2d900a
new_phil

# ╔═╡ 65597876-6599-11eb-15bd-014088e9880b
begin
	new_phil2 = copy(new_phil)
	new_phil2[100:200, 1:100] .= RGB(1.0, 0, 0)
	new_phil2
end

# ╔═╡ 528a3b44-659a-11eb-2dcf-b38a54c165a4
decimate(image, ratio=5) = image[1:ratio:end, 1:ratio:end]

# ╔═╡ c9bc22ac-6599-11eb-32ae-234f5dc5cf1e
decimate(new_phil, 5)

# ╔═╡ 5a19e906-659a-11eb-0ead-9bc77fede7b8
element = "one"

# ╔═╡ d53363b0-659a-11eb-1b61-3f9ab49c1e22
fill( element, 3, 4)

# ╔═╡ fed9fd8c-659a-11eb-3a12-b7ec64b7e354
typeof( element )

# ╔═╡ 0af7d03a-659b-11eb-17e4-8f19029cbbb9
keeptrack = [typeof(1), typeof(1.0), typeof("one"), typeof(1//1)]

# ╔═╡ 165861ac-659f-11eb-1eca-4b978d5807ab
kernelz = Kernel.Laplacian()

# ╔═╡ 3afa1064-659f-11eb-3ec5-43aeecee0d5e
imfilter(decimate(philip, 11), kernelz)

# ╔═╡ Cell order:
# ╠═99b84d9a-6596-11eb-3780-493842c9a741
# ╠═f146123e-6596-11eb-053f-d7ca76637cca
# ╠═2cacddf2-6597-11eb-30d7-7b09b1695f87
# ╠═ff784890-6596-11eb-1267-9d22e395e0b5
# ╠═54c2894c-6598-11eb-180b-93b112c4e74f
# ╠═6a60375e-6598-11eb-05cb-91afafa6e6b5
# ╠═79134106-6598-11eb-2a5a-c56b1d571be7
# ╠═81645246-6598-11eb-0611-17bde8634f7d
# ╠═8e1b7d48-6598-11eb-2795-fdc2b39d567d
# ╠═b613dfca-6598-11eb-21b8-1f93b0ded964
# ╠═e4bc8520-6598-11eb-14fa-f367f607b244
# ╠═ec194966-6598-11eb-29ac-db0ffaef9645
# ╠═167290dc-6599-11eb-28dd-d365002a76f7
# ╠═3648e29e-6599-11eb-3f49-9376d6df65d7
# ╠═270e0f16-6599-11eb-2f6b-1ba4ddde780f
# ╠═5e73d080-6599-11eb-1840-4788cf2d900a
# ╠═65597876-6599-11eb-15bd-014088e9880b
# ╠═528a3b44-659a-11eb-2dcf-b38a54c165a4
# ╠═c9bc22ac-6599-11eb-32ae-234f5dc5cf1e
# ╠═5a19e906-659a-11eb-0ead-9bc77fede7b8
# ╠═d53363b0-659a-11eb-1b61-3f9ab49c1e22
# ╠═fed9fd8c-659a-11eb-3a12-b7ec64b7e354
# ╠═0af7d03a-659b-11eb-17e4-8f19029cbbb9
# ╠═1a4aabc8-659d-11eb-147f-d70f4bab0dd8
# ╠═165861ac-659f-11eb-1eca-4b978d5807ab
# ╠═3afa1064-659f-11eb-3ec5-43aeecee0d5e
