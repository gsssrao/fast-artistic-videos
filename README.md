# Arbitrary Style Transfer for Videos
This repository's code has been merged with [AdaIN-style](https://github.com/xunhuang1995/AdaIN-style). This repository will contain only experiments and minor improvements. All major updates will be merged with [AdaIN-style](https://github.com/xunhuang1995/AdaIN-style).

Presently, I do style transfer on a frame by frame basis. I store style features so that style image is processed only once. This creates a speedup of about 1.2-1.4x.

I have yet to include optical flow to optimize it (like in [artistic-videos](https://github.com/manuelruder/artistic-videos) repository). This will require retraining to support temporal consistency. But, this is way faster in comparison to artistic-videos as it peforms style transfer using Adaptive Instance Normalization.

![](https://github.com/gsssrao/fast-artistic-videos/blob/master/examples/outputBunny.gif)

![](https://github.com/gsssrao/fast-artistic-videos/blob/master/examples/outputStarwars.gif)

## Dependencies

### Dependencies of [AdaIN-style](https://github.com/xunhuang1995/AdaIN-style)
* [torch7](https://github.com/torch/torch7)
* [unsup](https://github.com/koraykv/unsup) (Only if you are using **color-preserved style transfer**)

Optionally:
* CUDA and cuDNN
* [cunn](https://github.com/torch/cunn)
* [torch.cudnn](https://github.com/soumith/cudnn.torch)

### Extra Dependencies
* [ffmpeg](https://ffmpeg.org/)

## Execution Time

For a 10s video with 480p resolution it takes about 2 minutes on a Titan X Maxwell GPU (12GB).

## Download
```
bash models/download_models.sh
```

## TODO
- [ ] Add audio support
- [ ] Retrain to incorporate motion information

## Usage
### Basic usage
```
bash styVid.sh input.mp4 style-dir-path
```

This generates 1 mp4 for each image present in ```style-dir-path```. Next follow the instructions given by prompt.

To, change other parameters like alpha etc. edit ```test.lua```.

### Example usage
```
bash styVid.sh input/videos/cutBunny.mp4 input/styleexample
```

This will first create two folder namely ```videos``` and ```videoprocessing```. Then it will generate three mp4 files namely ```cutBunny-stylized-mondrian.mp4```, ```cutBunny-stylized-woman_with_hat_matisse.mp4``` and ```cutBunny-fix.mp4``` in ```videos``` folder. I have included the files in ```examples/Result``` folder for reference. 

The individual frames and output would be present in ```videoprocessing``` folder.

## Example Video

An example video with some results can be seen [here](https://www.youtube.com/watch?v=vVkufidT0fc&t=1s) on youtube.

## Citation

If you find this code useful for your research, please cite the paper:

```
@article{huang2017adain,
  title={Arbitrary Style Transfer in Real-time with Adaptive Instance Normalization},
  author={Huang, Xun and Belongie, Serge},
  journal={arXiv preprint arXiv:1703.06868},
  year={2017}
}
```

