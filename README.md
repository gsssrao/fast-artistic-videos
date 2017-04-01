# Arbitrary Style Transfer for Videos
This repository is based on work by Huan Xun on [AdaIN-style](https://github.com/xunhuang1995/AdaIN-style). The extension done is added support for videos. 

Presently, this just does style transfer on a frame by frame basis. I have yet to include optical flow to optimize it (like in [artistic-videos](https://github.com/manuelruder/artistic-videos) repository). But, this is way faster in comparison to artistic-videos as it peforms style transfer using Adaptive Instance Normalization.

## Dependencies
* All the dependencies of [AdaIN-style](https://github.com/xunhuang1995/AdaIN-style)
* [ffmpeg](https://ffmpeg.org/)

## Download
```
bash models/download_models.sh
```

## Usage
### Basic usage
```
bash styVid.sh input.mp4 style-dir-path
```

This generates 1 mp4 for each image present in ```style-dir-path```. Next follow the instructions given by prompt.

To, change other parameters like alpha etc. edit ```test.lua```.

### Example usage
```
bash styVid.sh cutBunny.mp4 style
```

This will generate two mp4 files namely ```cutBunny-stylized-mondrian.mp4``` and ```cutBunny-stylized-woman_with_hat_matisse.mp4``` in this directory. I have included the files in ```examples/Result``` folder for reference. 

The individual frames would be present in ```input/cutBunny``` folder and outputs would generated similarly in output folder.

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

