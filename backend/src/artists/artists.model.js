import prisma from "../repository/prisma.js";

export const getAllItems = async () => {
  try {
    console.log("getAllItems called from model");
    const artists = await prisma.artists.findMany();
    console.log("Artists retrieved:", artists);
    return artists;
  } catch (error) {
    throw new Error(error.message);
  }
};

export const getItemById = async (id) => {
  try {
    const artist = await prisma.artists.findUnique({
      where: { id }
    });
    if (!artist) {
      throw new Error("Artist not found");
    }
    return artist;
  } catch (error) {
    throw new Error(error.message);
  }
};

export const createItem = async (artistData) => {
  try {
    const artist = { ...artistData };
    //const artist = await db.Artist.create(artistData);
    return artist;
  } catch (error) {
    throw new Error(error.message);
  }
};

export const updateItem = async (id, artistData) => {
  try {
    //const artist = await db.Artist.findByPk(id);
    const artistIndex = db?.artists?.findIndex((a) => a.id === id);
    if (artistIndex === -1) {
      throw new Error("Artist not found");
    }
    db.artists[artistIndex] = { ...db.artists[artistIndex], ...artistData };
    return db.artists[artistIndex];
  } catch (error) {
    throw new Error(error.message);
  }
};

export const deleteItem = async (id) => {
  try {
    //const artist = await db.Artist.findByPk(id);
    const artistIndex = db?.artists?.findIndex((a) => a.id === id);
    if (artistIndex === -1) {
      throw new Error("Artist not found");
    }
    db.artists.splice(artistIndex, 1);
    return { message: "Artist deleted successfully" };
  } catch (error) {
    throw new Error(error.message);
  }
};