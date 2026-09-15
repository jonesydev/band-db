import { describe, it, expect } from "vitest";
import request from "supertest";
import app from "../src/app.js";
import prisma from "../src/repository/prisma.js";  

describe("GET /artists", () => {
  it("should return a list of artists", async () => {
    // Wait for the database connection to be established before making the request.
    const response = await vi.waitFor(() => request(app).get("/artists"), { timeout: 5000 , interval: 100 });    
    expect(response.status).toBe(200);
    //expect(Array.isArray(response.body)).toBe(true);
  });

   test.afterAll(async () => {
     // Close the db after all tests are done
     await prisma.$disconnect();
   }); 
});

describe("GET /artists/:id", () => {
  it("should return a single artist by ID", async () => {
    const response = await vi.waitFor(() => request(app).get("/artists/1 "), { timeout: 5000 , interval: 100 });    
    //const response = await request(app).get("/artists/1");
    expect(response.status).toBe(200);
    //expect(response.body).toHaveProperty("id", 1);
  });

  it("should return 404 if artist not found", async () => {
    const response = await request(app).get("/artists/9999");
    expect(response.status).toBe(404);
  });

  test.afterAll(async () => {
     // Close the db after all tests are done
     await prisma.$disconnect();
   }); 
});

describe("POST /artists", () => {
  it("should create a new artist", async () => {
    const newArtist = { name: "New Artist" };
    const response = await request(app).post("/artists").send(newArtist);
    expect(response.status).toBe(201);
    expect(response.body).toHaveProperty("name", "New Artist");
  });
});

describe("PUT /artists/:id", () => {
  it("should update an existing artist", async () => {
    const updatedArtist = { name: "Updated Artist" };
    const response = await request(app).put("/artists/1").send(updatedArtist);
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty("name", "Updated Artist");
  });

  it("should return 404 if artist not found", async () => {
    const updatedArtist = { name: "Updated Artist" };
    const response = await request(app).put("/artists/9999").send(updatedArtist);
    expect(response.status).toBe(404);
  });
});

describe("DELETE /artists/:id", () => {
  it("should delete an existing artist", async () => {
    const response = await request(app).delete("/artists/1");
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty("message", "Artist deleted successfully");
  });

  it("should return 404 if artist not found", async () => {
    const response = await request(app).delete("/artists/9999");
    expect(response.status).toBe(404);
  });
}); 

