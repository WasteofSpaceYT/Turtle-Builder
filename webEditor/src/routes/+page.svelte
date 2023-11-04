<script lang="ts">
	import { onMount } from 'svelte';
	import * as THREE from 'three';
	import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';

	const scene = new THREE.Scene();
	let camera: THREE.PerspectiveCamera;
	let renderer: THREE.WebGLRenderer;
	const geometry = new THREE.BoxGeometry(1, 1, 1);
	const material = new THREE.MeshBasicMaterial({ color: 0xffffff });
	const cube = new THREE.Mesh(geometry, material);
	scene.add(cube);

	const resize = () => {
		renderer.setSize(window.innerWidth, window.innerHeight);
		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
	};
	function animate() {
		requestAnimationFrame(animate);
		renderer.render(scene, camera);
	}
	const createScene = (canvas: HTMLCanvasElement) => {
		renderer = new THREE.WebGLRenderer({ antialias: false, canvas });
		resize();
	};
	let canvas: HTMLCanvasElement;
	onMount(() => {
		camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
		createScene(canvas);
		console.log('done');
		console.log(scene.background);
		document.body.appendChild(renderer.domElement);
		camera.position.z = 5;
		console.log(camera.position);
		const controls = new OrbitControls(camera, renderer.domElement);
		animate();
	});
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<body>
	<canvas bind:this={canvas} />
</body>
<svelte:window on:resize={resize} />
