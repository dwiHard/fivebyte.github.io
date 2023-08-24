from pytube import YouTube
url = 'https://www.youtube.com/watch?v=G1BcXol14u8'
video = YouTube(url)
stream = video.streams.get_highest_resolution()

stream.download(output_path = '/home/hard/Documents/python/medsos/YtDownload/')
