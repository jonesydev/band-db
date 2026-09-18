 import {getAllItems, getItemById, createItem, updateItem, deleteItem} 
   from './artists.model.js';

export const getAllArtists = (req, res) => {
  try {
    const artists = getAllItems();
    res.send(artists);
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
};

export const getArtistById = async (req, res) => {
  try {
    const artist = getItemById(parseInt(req.params.id));
   
    if (!artist) {
      return res.status(404).json({ message: "Artist not found" });
    }

    res.json(artist);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const createArtist = async (req, res) => {
  try {
    const artist = await prisma.artist.create({
      data: req.body,
    });

    res.status(201).json(artist);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

export const updateArtist = async (req, res) => {
  try {
    const artist = await prisma.artist.update({
      where: { id: parseInt(req.params.id) },
      data: req.body,
    });
    res.json(artist);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

export const deleteArtist = async (req, res) => {
  try {
    const artist = await prisma.artist.delete({
      where: { id: parseInt(req.params.id) },
    });

    if (!artist) {
      return res.status(404).json({ message: "Artist not found" });
    }
    
    res.json({ message: "Artist deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
